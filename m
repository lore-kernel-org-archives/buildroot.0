From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Mar 2014 16:16:02 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-03-28
In-Reply-To: <20140329175452.5c711852@skate>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate>
Message-ID: <53371BF2.4000603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/29/2014 01:54 PM, Thomas Petazzoni wrote:

>>    powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/8d0e312f2cdd700c42775404f93173606eb99161/
> 
> Gustavo, mpd is your stuff :)

4.6.x is the minimum gcc for mpd and that's a 4.6.0 gcc, can you update it?
Older 4.6.x series were really bad for e500 powerpc and C++.
Regards.
