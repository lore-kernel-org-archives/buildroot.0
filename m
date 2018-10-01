From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 1 Oct 2018 08:00:42 -0500
Subject: [Buildroot] [PATCH v2 1/8] busybox: update S01logging
In-Reply-To: <20180929025006.8296-1-casantos@datacom.com.br>
References: <20180929025006.8296-1-casantos@datacom.com.br>
Message-ID: <CANQCQpZcvd=+1Q4m-fNJsp1bwHqUPMLp07-K+KH943UHVpBMBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Fri, Sep 28, 2018 at 9:50 PM Carlos Santos <casantos@datacom.com.br> wrote:
>
> Reformat and fix syslogd/klogd startup script for better quality and
> code style:
>
> - Detect and report start/stop errors (previous version ignored them and
>   always reported OK).
> - Use a separate function for restart.
> - Implement reload as restart.
> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.
>
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
