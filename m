From: Jenkins, Lee (ISS Houston) <Lee.Jenkins@hp.com>
Date: Wed, 23 Jan 2013 15:40:51 +0000
Subject: [Buildroot] firewall or ...?
In-Reply-To: <20130123163000.52ebc529@skate>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E42155@G4W3291.americas.hpqcorp.net>
 <20130123163000.52ebc529@skate>
Message-ID: <2DD0B9C711CDFC45A3A266C78966CE7F40E42221@G4W3291.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops. It may be the LAN after all. I tried from a 3rd client and it works. Not sure why I can ssh from the other two clients, but for now I can see there is no firewall problem.

Thanks for the quick reply, Thomas!

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Wednesday, January 23, 2013 9:30 AM
To: Jenkins, Lee (ISS Houston)
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] firewall or ...?

Dear Jenkins, Lee (ISS Houston),

On Wed, 23 Jan 2013 15:22:56 +0000, Jenkins, Lee (ISS Houston) wrote:

> It looks open to me. Can anyone suggest why the web server is only
> serving requests from localhost?

It might be configured explicitly to listen only on localhost, or it
might bind itself only on the interfaces that are up at the moment the
web server is started.

Do you get a "Connection refused", or does your HTTP client times out?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
