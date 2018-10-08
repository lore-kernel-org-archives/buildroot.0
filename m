From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Oct 2018 10:31:58 -0500
Subject: [Buildroot] [PATCH v3 4/8] rsyslog: add logging configuration
 file
In-Reply-To: <20181007114605.18153-5-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181007114605.18153-5-casantos@datacom.com.br>
Message-ID: <CANQCQpaTaDF+_fVidm+u6r=ksK-fJ__jrDNO84MDBEzRGoW+0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Sun, Oct 7, 2018 at 6:46 AM Carlos Santos <casantos@datacom.com.br> wrote:
>
> Provide a template to help users to customize rsyslog without editting
> the startup script. Also warn about options that must not be used.
>
> Add instructions on how to configure debugging, since it a bit tricky
> when rsyslogd runs in background, requiring a separete log file.
>
> This file is also useful as an example for init script authors.
>
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Similar to the busybox config, I disabled the logger and the init
script reflected the change.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
