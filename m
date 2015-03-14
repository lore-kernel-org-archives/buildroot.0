From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Mar 2015 17:04:39 +0100
Subject: [Buildroot] kodi: build errors
In-Reply-To: <CAJ4jsad4Lqma5_CjCeXZ6JtPWMsrWZpr9a672VLW-K7b9d-BcQ@mail.gmail.com>
References: <CAJ4jsacVyYjMJXaQ=AzWKV+wxT5kh_MswyvaP5KUmmKpngjouQ@mail.gmail.com>
 <20150312112559.627104ad@free-electrons.com>
 <CAJ4jsad4Lqma5_CjCeXZ6JtPWMsrWZpr9a672VLW-K7b9d-BcQ@mail.gmail.com>
Message-ID: <20150314170439.5d110dc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos A. M. dos Santos,

On Sat, 14 Mar 2015 12:14:29 -0300, Carlos A. M. dos Santos wrote:

> OK, I restored the kodi configuration files to the original ones. I'm
> sending the .config file.

Your configuration file indicates:

  Buildroot 2015.05-git-00354-gf574230-dirty Configuration

Which means you have some uncommitted changes to Buildroot. Since I
don't know which changes you've made, how can I be sure that the
changes you've made are not the reason for the problem?

But anyway, I will start a build with your configuration.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
