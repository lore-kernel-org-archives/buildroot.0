From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jan 2013 16:30:00 +0100
Subject: [Buildroot] firewall or ...?
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F40E42155@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E42155@G4W3291.americas.hpqcorp.net>
Message-ID: <20130123163000.52ebc529@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
