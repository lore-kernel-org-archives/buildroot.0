From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 11:52:02 +0100
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.2
In-Reply-To: <20170314223302.5630350f@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 14 Mar 2017 22:33:02 +0100")
References: <20170314150039.9913-1-peter@korsgaard.com>
 <20170314220145.664560df@free-electrons.com>
 <871stzv9jf.fsf@dell.be.48ers.dk>
 <20170314223302.5630350f@free-electrons.com>
Message-ID: <87mvcmu819.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 14 Mar 2017 22:21:56 +0100, Peter Korsgaard wrote:

 >> Well, it is both. 1.0.2 is a security fix for 1.0.1, but as we hadn't
 >> moved to the 1.0.x series yet it isn't a pure security bump.

 > It isn't at all :)

 >> I saw the alert so I started working on the update, and only at the end
 >> noticed that the issue didn't actually affect the 0.8.x series. I could
 >> have structured it as 2 separate patches, a bump from 0.8.21 -> 1.0.1 +
 >> a security bump to 1.0.2, but that seemed a bit silly to me.

 > Agreed, 2 patches seem silly.

 >> I can reword the commit text if you have a good idea about how to
 >> explain it?

 > I would simply not indicate in the title that it is a security bump. If
 > it were a security bump, we would have to apply it to the LTS branch,
 > while considering what you explained, we do not need to apply this
 > patch to the LTS branch, because the old 0.8.21 is unaffected. Unless
 > of course, 0.8.21 is affected by other security issues.

Ok, thanks. Committed after rewording the commit description.

-- 
Bye, Peter Korsgaard
