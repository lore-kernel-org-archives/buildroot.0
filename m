From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 20:46:54 +0200
Subject: [Buildroot] [Buildroot website] Missing image(s?) files
In-Reply-To: <560FE3D8.7090703@mind.be> (Arnout Vandecappelle's message of
 "Sat, 3 Oct 2015 15:19:04 +0100")
References: <40125828.rcXOoJhnam@laclwks004> <560FE3D8.7090703@mind.be>
Message-ID: <87io6n3i3l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> in ?17.19.2, "How to add a package from GitHub", at least,
 >> there is an obviously missing image `github_hash_mongrel2.png'
 >> (see just about the second (last) ?-list).

 >  I can confirm that this is the case on the website, but my local build is fine.
 > So I guess the images are not copied correctly to the website. Peter?

Indeed, my release script was only copying manual.{html,text}. I've
fixed that manually and updated the script.

Thanks!

-- 
Bye, Peter Korsgaard
