using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JasonMorsley.Dev.WalkingSkeleton.API.Controllers.v1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/greeting")]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public class ApiController : ControllerBase
    {
        #region GET

        /// <summary>
        /// Get a greeting
        /// </summary>
        /// <returns>The requested greeting</returns>
        /// <response code="200">Success - OK - Returns a greeting</response>
        /// <response code="400">Error - Bad Request - It was not possible to bind the request JSON</response>
        [HttpGet]
        [Produces("application/json")]
        [ProducesResponseType(typeof(string), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public IActionResult Get()
        {
            return Ok("Hello!");
        }

        #endregion GET
    }
}