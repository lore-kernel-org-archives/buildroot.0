From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Apr 2021 09:32:36 +0200
Subject: [Buildroot] [PATCH] package/avahi: ignore CVE-2021-26720
In-Reply-To: <50c20ed8-3ed3-e75c-fe63-50d8a77eefef@mind.be> (Arnout
 Vandecappelle's message of "Wed, 7 Apr 2021 20:42:20 +0200")
References: <20210407135423.28899-1-peter@korsgaard.com>
 <50c20ed8-3ed3-e75c-fe63-50d8a77eefef@mind.be>
Message-ID: <87im4xb59n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 07/04/2021 15:54, Peter Korsgaard wrote:
 >> CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is part of
 >> the Debian packaging and not part of upstream avahi - So ignore the CVE.
 >> 
 >> https://security-tracker.debian.org/tracker/CVE-2021-26720
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 >  Applied to master, thanks.

 >  BTW, is there an easy way to run the CVE check for a single package? Or do you
 > really have to go through configure + pkg-stats?

I'm afraid so. Thomas?

-- 
Bye, Peter Korsgaard
