From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Mar 2012 12:25:52 -0300
Subject: [Buildroot] =?utf-8?q?Q=3A_webkit=3F?=
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6702FF68AD@WETMEX10.loepfe.com>
References: <mailman.63133.1329751235.2942.buildroot@busybox.net>
 <1531E53627F1F749B4FE809BF2A4EB6702FF68AD@WETMEX10.loepfe.com>
Message-ID: <155f0f0f67543659afeeb1371b8f2585@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-20 13:18, Vellemans, Noel wrote:

> Hi all,
>
> Probing for some info.
>
> Anyone working on (or succeeded) building a more recent version of
> WebKit (>= 1.2.7) on buildroot?
>
>
> Regards,
> Noel

Hi.
I gave a shot at the 1.6.x series a couple of weeks ago and hit some 
issues when building for a non-X11 (directfb to be precise) target.
It wanted some X libs even though it was an X-free scenario.
Did you move forward on your end on webkit?
Regards.
