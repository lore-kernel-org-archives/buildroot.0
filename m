From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jun 2017 17:03:46 +0200
Subject: [Buildroot] [PATCH v2] new package: ratpoison
In-Reply-To: <CAKKQwLSi=CG40UMyg_2jrqL7tn5WJHJXprcveG1d3ai-2gWjGA@mail.gmail.com>
References: <20170512220246.18575-1-mrugiero@gmail.com>
 <20170601143349.5406-1-mrugiero@gmail.com>
 <20170606230136.7240eb7a@free-electrons.com>
 <CAKKQwLSi=CG40UMyg_2jrqL7tn5WJHJXprcveG1d3ai-2gWjGA@mail.gmail.com>
Message-ID: <20170607170346.2ef250e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Jun 2017 20:02:11 -0300, Mario Rugiero wrote:

> > The license really was GPL-2.0+, not GPL-2.0.  
> It didn't seem like it was GPL-2.0+ in the COPYING file, but I may be wrong.

The COPYING file never specifies if it's "or later" or not. The COPYING
file contains the text of one specific version of the license. It's
then the copyright notice at the beginning of source files that will
say "covered by GPL version 2" or "covered by GPL version 2 or later".

Check the ratpoison source files, they say "or later". Hence the
GPL-2.0+.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
