From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 9 May 2015 09:14:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-05-08
In-Reply-To: <20150509063015.990CD10160E@stock.ovh.net>
References: <20150509063015.990CD10160E@stock.ovh.net>
Message-ID: <CA+TH9VnQN1Vs-J+dMXgBc6uCWgugprDh=v85RKebcs=60dQFAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

>          arm |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/227f942107e4fcbc14bb1e7d97e1e2758d6f3f2d/

I think I found the cause of the problem. Unfortunately mono 4.0.1 is
not the latest version, but 4.0.0 is. It's not obvious from the
download listing page, it's a little bit clearer from the download
front page that clearly says "The latest Mono release is: 4.0.0".
Indeed mono-4.0.0.tar.bz2 was updated on May 5th, mono-4.0.1.tar.bz2
it's a couple of weeks older. Probably mono-4.0.1.tar.bz2 was just
released as a mistake.

I'll send a patch in minutes!

Sincerely, Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
