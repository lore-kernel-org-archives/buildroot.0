From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 21:35:44 +1300
Subject: [Buildroot] [V4 1/1] python-mutagen: new package
In-Reply-To: <CAGm1_kvv333QSzgkE2iaeJ89Z48xJAVcSK+qSD2VaTr89bANeA@mail.gmail.com>
References: <20170125162610.24101-1-aduskett@codeblue.com>
 <20170126210844.719a364b@free-electrons.com>
 <CAGm1_kvv333QSzgkE2iaeJ89Z48xJAVcSK+qSD2VaTr89bANeA@mail.gmail.com>
Message-ID: <20170126213544.63e1d65c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 09:15:52 +0100, Yegor Yefremov wrote:

> This is the stuff I still don't really grok. How do I tell whether it
> is GPLv2 or GPLv2+?
> 
> This passage [1] contains such a sentence:
> 
> "either version 2 of the License, or (at your option) any later version."

Have you read this part of the license? It is an *example* of what you
can put in the header of your files to indicate what the license is.

So this part of the license is an *example*, it does not tell you at
all what is the license that applies to this package.

To know whether it's GPLv2 or GPLv2+ you have to open an actual source
file, and look at its copyright header. If it says "version 2 or
later", then it's GPLv2+. If it says "version 2", then it's GPLv2 only.

If you look at the mutagen source code, all source files I could see
mention just "version 2", hence GPLv2.

Please read again the text of the GPL around the line you indicated.
You will understand better what it means.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
