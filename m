From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Oct 2018 10:23:16 -0500
Subject: [Buildroot] [PATCH v3 2/8] busybox: add logging configuration
 file
In-Reply-To: <20181007114605.18153-3-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181007114605.18153-3-casantos@datacom.com.br>
Message-ID: <CANQCQpbzvv=CE_5c9ZwokivqwMLWY92E9wks12ru1-Op6tXBqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Sun, Oct 7, 2018 at 6:46 AM Carlos Santos <casantos@datacom.com.br> wrote:
>
> Provide a template to help users to customize syslogd and klogd without
> editting the startup script.
>
> syslogd options worth to configure are remote logging (-R), rotation
> (-s, -b) and minimal priority level (-l).
>
> klogd minimal priority level (-c) can be configured too, preventing
> non-critical kernel messages from appearing on the console.
>
> This file is also useful as an example for init script authors.
>
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Tested the disable option in the config and the init script picked it
up as expected.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
