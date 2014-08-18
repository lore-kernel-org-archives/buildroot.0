From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Aug 2014 16:52:48 +0200
Subject: [Buildroot] [PATCHv2 1/2] getent: new package
In-Reply-To: <CAAXf6LWWdZF12uQBX487i71S8JLSqDuFf3tRtLfPhK=wbJd-Mg@mail.gmail.com>
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LWWdZF12uQBX487i71S8JLSqDuFf3tRtLfPhK=wbJd-Mg@mail.gmail.com>
Message-ID: <20140818165248.393a57db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 18 Aug 2014 13:50:57 +0200, Thomas De Schampheleire wrote:

> How do you conclude this license?

uclibc: there is no license specific in the script itself, so by
default it's the same license as the entire project, i.e LGPLv2.1+

glibc: the header comment in nss/getent.c is clear: it's under
LGPLv2.1+.

> Isn't this dependent on the case glibc versus uclibc/musl ? Or do each
> of these use the same license?

See above :)

> Also, shouldn't we specify GETENT_LICENSE_FILES and make sure the
> appropriate license text is present?

Which license text file should be used? In neither of the uclibc/musl
or glibc cases we have access to the license text. I can include a
COPYING file in package/getent/, but that's going to be 100x times
larger than the getent script :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
