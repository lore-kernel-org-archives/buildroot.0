From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 17 May 2012 16:48:25 +0200
Subject: [Buildroot] packages not available after compilation
In-Reply-To: <CAFC29aUznWdUQiR_ep6fZ-76=8th5VmLhyAOUwPdbfOtzD-15Q@mail.gmail.com>
References: <CAFC29aUznWdUQiR_ep6fZ-76=8th5VmLhyAOUwPdbfOtzD-15Q@mail.gmail.com>
Message-ID: <CAAXf6LVJWf6WekxWABF67hR_TL10V-VcaxBeFcV1P_ZA0U09Lw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[now properly sending to the list]

On Thu, May 17, 2012 at 1:37 AM, Ron Eggler <reggler@semiosbio.com> wrote:
> Hi,
>
> I have added several packages, run make and had to realize that they're not
> available.
> Tweakings and multiple recompile attempts later, I still find myself at the
> same spot. I'm not sure where to go from here. Some assistance would be
> greatly appreciated!
> I uploaded my archived and uploaded my package directory
> to?http://inetgate.ca/public/package.tar.bz2
> Any suggestions and hints are appreciated!

Did you create proper Config.in files for them and did you enable
these packages in .config, for example by using 'make menuconfig' ?
