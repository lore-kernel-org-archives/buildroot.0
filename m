From: Michael Rommel <rommel@layer-7.net>
Date: Sun, 29 Sep 2013 14:59:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-28
In-Reply-To: <20130929063005.E848752C1A0@lolut.humanoidz.org>
References: <20130929063005.E848752C1A0@lolut.humanoidz.org>
Message-ID: <E69A5ED7-8837-4975-B209-CB92E817949A@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I took the config file from: 

  http://autobuild.buildroot.net/results/9fb298d4e09a6f9b88207909d583dce05392048e/config

and reproduced the error. After some tinkering I found that the build option "prefer static libraries" causes aiccu and knock to not compile on the arm architecture. I am not expert enough to find out why this is the case, so I wanted to ask whether there is a way to specify for some programs that they are not compatible with this setting and maybe disable them from being shown in the menuconfig. 

Or if someone has an idea where I could start looking, please tell me. I have no clue, why static linking fails completely, even when the libraries are available in .../target/usr/lib, e.g. libgnutls.a and .la. 

  Michael.

-- 
Michael Rommel, Erlangen, Germany

On Sep 29, 2013, at 8:30 , Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2013-09-28
> ===============================
> 
>                aiccu-20070115 | 2 
> 
> Detail of failures
> ===================
> 
>      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/308087e1f85e822dec8b73a3ed892c7cd2376cbd/
>       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/9fb298d4e09a6f9b88207909d583dce05392048e/
> 
> 
