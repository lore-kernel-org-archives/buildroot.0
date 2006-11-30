From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 30 Nov 2006 17:51:43 +0100
Subject: [Buildroot] uClibc/gcc build problems?
In-Reply-To: <456F0A76.9060501@computing.dundee.ac.uk>
References: <456F0A76.9060501@computing.dundee.ac.uk>
Message-ID: <20061130165143.GA2156@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 30, 2006 at 04:44:38PM +0000, Peter Mendham wrote:
>I am attempting to build buildroot revision 16738 (the latest at the 
>time of writing) for a powerpc.  It seems to hit a snag during the 
>compilation of gcc.  I don't think my configuration makes any difference 
>at this stage of play, but if it does: I went with almost all the 
>default options apart from software FP, I remooved the hdparm and sudo 
>packages and added DHCP client support, I answered all of the prompts 
>during make (is there an MMU etc.) with the default options.  The 
>relevant (I hope) portion of the output from the make is given below.
>
>I don't really know where to start with this. Any help greatly appreciated.

wrong list. Ping andersee on the uclibc list that he caused this with
r16733 ;)

meanwhile, svn diff -r16732:16733 | patch -R -p0
makes it compile again..
HTH,
