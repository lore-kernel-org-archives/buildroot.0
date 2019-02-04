From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Feb 2019 15:21:47 +0100
Subject: [Buildroot] [PATCHv4] package/pugixml: add support for a
 limited set of configuration options
In-Reply-To: <20190204100613.25609-1-patrickdepinguin@gmail.com>
References: <20190204100613.25609-1-patrickdepinguin@gmail.com>
Message-ID: <7f56072a-c462-b10d-df4d-03ba11549058@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/02/2019 11:06, Thomas De Schampheleire wrote:
> From: Wouter Vermeiren <wouter.vermeiren@nokia.com>
> 
> Add config options for a few pugixml configurables.
> 
> - Xpath support is enabled by default but has a size impact. Disabling it
>   reduces the size significantly (it almost halves). Output of 'size' on the
>   library compiled for x86:
>   - Xpath support enabled
>  160374	   1244	     28	 161646	  2776e	output/target/usr/lib/libpugixml.so.1.7
>   - Xpath support disabled
>   92754	    880	      8	  93642	  16dca	usr/lib/libpugixml.so.1.7
> 
> - Compact and header-only modes are not strictly needed for our use case, but we
>   did the work anyway and may be useful for someone else.
> 
> Signed-off-by: Wouter Vermeiren <wouter.vermeiren@nokia.com>
> [ThomasDS:
> - align with Buildroot coding style
> - retain only feature options: xpath, compact mode, header-only]
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 Applied to master, thanks.

 Regards,
 Arnout
