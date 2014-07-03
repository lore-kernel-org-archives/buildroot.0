From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 18:19:46 +0200
Subject: [Buildroot] Incorrect ABI setting on ubuntu 14.04LTS
In-Reply-To: <20140703150914.GT9025@tarshish>
References: <CAFRxoJn5x=5YbSCOsMu7XB1PS2Dv2=fyih7nrwMmde0YtveeTQ@mail.gmail.com>
 <20140703092010.GO9025@tarshish> <20140703092420.GP9025@tarshish>
 <20140703113316.3100783a@free-electrons.com>
 <CAFRxoJnfkQ1xZDd_Q5h_qzWXkrsJCdUTBv6APB6VvFFH1ad20g@mail.gmail.com>
 <20140703164206.40a17ed0@free-electrons.com>
 <20140703145401.GS9025@tarshish>
 <20140703165750.3529d265@free-electrons.com>
 <20140703150914.GT9025@tarshish>
Message-ID: <20140703181946.697c2ff8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 3 Jul 2014 18:09:14 +0300, Baruch Siach wrote:

> Related to this: why do we redirect stderr of the compiler invocation to 
> /dev/null in check_arm_abi? We are not interested in the output itself as we 
> only check whether the compiler runs successfully. When the test succeeds it 
> should not output anything. Whereas in the failing case the output is very 
> interesting.

Indeed, would make sense to not redirect stderr to give more clue to
the user about what's going on.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
