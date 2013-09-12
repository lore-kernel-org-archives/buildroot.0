From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 18:56:09 +0200
Subject: [Buildroot] Building Manual Errors
In-Reply-To: <CAAXf6LXS_9G=329VecwOD8hd9x+DD8+6O96o7xPn2jZi6s2iAg@mail.gmail.com>
References: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
 <CAAXf6LWJ8DM-UBfEi=quWo7g-g_RGSYuRgEJM_y__mh+10F3pQ@mail.gmail.com>
 <OF56171A80.616C14AA-ON86257BE4.0059D6AD-86257BE4.005A710F@rockwellcollins.com>
 <20130912183745.64503913@skate>
 <CAAXf6LXS_9G=329VecwOD8hd9x+DD8+6O96o7xPn2jZi6s2iAg@mail.gmail.com>
Message-ID: <20130912185609.4e04fb9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 12 Sep 2013 18:51:22 +0200, Thomas De Schampheleire wrote:

> I agree with this.
> But I do think that it would be nice to check for missing
> dependencies, being asciidoc and w3m.

Agreed, but they should only be checked when the user actually tries to
build the documentation. I don't want to make these additional
mandatory dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
