From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 23:06:35 +0200
Subject: [Buildroot] [PATCH] moarvm: use libtommath
In-Reply-To: <20160428230418.25c63d4c@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 28 Apr 2016 23:04:18 +0200")
References: <1461873571-26319-1-git-send-email-francois.perrad@gadz.org>
 <20160428221227.79cf3ccf@free-electrons.com>
 <87oa8tv4y8.fsf@dell.be.48ers.dk>
 <20160428230418.25c63d4c@free-electrons.com>
Message-ID: <87fuu5v3xg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 28 Apr 2016 22:44:31 +0200, Peter Korsgaard wrote:

 >> > So what was happening before? It was using an internal copy of
 >> > libtommath?
 >> 
 >> Apparently:
 >> 
 >> ls output/build/moarvm-2016.04/3rdparty/
 >> dynasm  dyncall  libatomic_ops  libtommath  libuv  msinttypes  README.md
 >> sha1  tinymt  uthash.h

 > Would be good if it had been mentioned in the commit log...

Ehh yes, I actually wanted to amend the commit message - But I somehow
forgot to do so before pushing :/

-- 
Venlig hilsen,
Peter Korsgaard 
