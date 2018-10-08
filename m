From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Oct 2018 10:14:57 -0500
Subject: [Buildroot] [PATCH v3 1/8] busybox: update S01logging
In-Reply-To: <20181007114605.18153-2-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181007114605.18153-2-casantos@datacom.com.br>
Message-ID: <CANQCQpYS3b5HzMrkS4cHb6UApF0NOpnhxf31x6j5hD6aavp8rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Sun, Oct 7, 2018 at 6:46 AM Carlos Santos <casantos@datacom.com.br> wrote:
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
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
