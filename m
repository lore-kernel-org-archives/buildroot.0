From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Oct 2018 10:31:10 -0500
Subject: [Buildroot] [PATCH v3 3/8] rsyslog: update S01logging
In-Reply-To: <20181007114605.18153-4-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181007114605.18153-4-casantos@datacom.com.br>
Message-ID: <CANQCQpY+kpLmYGS-oXoAp=34EwA99zuML6za5mzbz-e7zA18Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Sun, Oct 7, 2018 at 6:46 AM Carlos Santos <casantos@datacom.com.br> wrote:
>
> Reformat and fix rsyslog startup script for better quality and code
> style:
>
> - Indent with tabs, not spaces.
> - Support a configuration file at /etc/default (an example file will be
>   added in forthcomming patch).
> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.
>
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
