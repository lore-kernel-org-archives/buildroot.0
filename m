From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 09:44:44 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+TH9Vk=EW0X4Z+6c8F=99-62fFt1J0LxkNwo_cNp2trMZ-8UA@mail.gmail.com>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
 <CA+TH9Vk=EW0X4Z+6c8F=99-62fFt1J0LxkNwo_cNp2trMZ-8UA@mail.gmail.com>
Message-ID: <20150506094444.0c4e6fb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Wed, 6 May 2015 09:34:32 +0200, Angelo Compagnucci wrote:

> Stating at today (2015-05-06) report, the error is gone. Honestly I
> think there is something in autobuild that makes parallel installation
> screws, cause I repeated at least a dozen of tests with different
> configurations and I'm using it in a side project (several more
> compilations) and never encountered this bug on my quad core machine.

No it isn't gone: it occurred again two times during this night,
http://autobuild.buildroot.org/?reason=host-mono-4.0.1.

(The 2015-05-06 autobuild e-mail reports failures that took place
between 2015-05-05 00:00 and 2015-05-06 00:00, European time).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
