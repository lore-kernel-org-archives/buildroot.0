From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 6 May 2015 09:34:32 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150505095952.4ddfd5b4@free-electrons.com>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
Message-ID: <CA+TH9Vk=EW0X4Z+6c8F=99-62fFt1J0LxkNwo_cNp2trMZ-8UA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

>>      powerpc |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/7980bbd50ab63ea2bf482b8f58493ac39790a213/
>>          arm |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/1eeb6b7f4c055968f1683a37cec2b2142923cd28/
>
> Smells like parallel installation issue, but not sure. Angelo tried to
> investigate, but was not able to reach a conclusion. Anyone to look at
> this?

Stating at today (2015-05-06) report, the error is gone. Honestly I
think there is something in autobuild that makes parallel installation
screws, cause I repeated at least a dozen of tests with different
configurations and I'm using it in a side project (several more
compilations) and never encountered this bug on my quad core machine.

Sincerely, Angelo
