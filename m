From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 23 Jan 2016 11:55:41 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122102957.10f29956@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <CAHXCMM+hzdHLqFS5f79vC9kWvaRJ-W1v_7tdLNYVM0mVNfbo3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Fri, Jan 22, 2016 at 10:29 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[...]
>>          arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/b48bc7ad4bede4d16c079da0ae1121e6796a0e8d/
>>          arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/25dcb19c3dd32e50990f9b45053d71ea18746a80/
>>          arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/a3f93498811491d37ba13d024e33e68a8bc7ba18/
>
> checking for dlopen in -lc... no
> configure: error: Cannot find dlopen in libdl nor libc. Use LDFLAGS=-Ldir to specify their location.
>
> In a static linking only situation.
>
> Samuel, can you have a look ? Most likely we should simply disable
> lttng-tools for static only scenarios.
Indeed.
Patches just sent ;-)
  http://patchwork.ozlabs.org/patch/572083/
  http://patchwork.ozlabs.org/patch/572084/

Regards,

-- 
Samuel
