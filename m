From: Ben Boeckel <mathstuf@gmail.com>
Date: Sat, 31 Oct 2015 13:58:43 -0400
Subject: [Buildroot] [PATCH v2 1/1] postgresql: add an option to build
	the server
In-Reply-To: <1445575419-8267-1-git-send-email-mathstuf@gmail.com>
References: <1445179920-2413-1-git-send-email-mathstuf@gmail.com>
 <1445575419-8267-1-git-send-email-mathstuf@gmail.com>
Message-ID: <20151031175843.GA9466@bronto-burt.dev.benboeckel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 23, 2015 at 00:43:39 -0400, Ben Boeckel wrote:
> Unfortunately, postgresql upstream doesn't have a configure option for
> this. Instead, to get bits of the build, compiling and installing
> different subdirectories is the preferred way.
> 
> The directories come from those used in the FreeBSD port.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - review by Thomas Petazzoni
>     - add client-if-not-server select for the postgresql package
>     - shell for -> $(foreach)
>     - remove empty variable "declarations"
>     - rewrap directory list variables
>     - simplify the directory listing variables
>     - document the directories being installed
>     - install fmgroids.h explicitly
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Hi,

Is there anything else I need to do here?

Thanks,

--Ben
