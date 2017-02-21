From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 09:12:41 +0100
Subject: [Buildroot] [PATCH v1] qt5quickcontrols: fix LTS (5.6) qml file
	install
In-Reply-To: <87efyspjzn.fsf@dell.be.48ers.dk>
References: <20170220214105.8106-1-ps.report@gmx.net>
 <20170220232328.65ea63b8@free-electrons.com>
 <87efyspjzn.fsf@dell.be.48ers.dk>
Message-ID: <20170221091241.431c354e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 23:37:00 +0100, Peter Korsgaard wrote:

> Yeah, I also didn't really like the repeated lines - But this way is
> atleast very minimal/safe.

Agreed. So will you apply Peter's patch?

> Alternatively the loop could be extended to check if the directory
> exists and otherwise skip it, then we wouldn't need the version check.

That's an option. It has the drawback of not failing if a directory
supposed to be there isn't, but OK.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
