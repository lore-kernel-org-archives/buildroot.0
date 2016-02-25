From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 17:21:39 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
	output file
In-Reply-To: <CAAXf6LVLzgK8WOODsVifFXhNuoOp82UJfTQwNmN7-D0coK0Y4g@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 25 Feb 2016 17:05:44
 +0100")
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
 <87fuwgx0ge.fsf@dell.be.48ers.dk>
 <CAAXf6LVLzgK8WOODsVifFXhNuoOp82UJfTQwNmN7-D0coK0Y4g@mail.gmail.com>
Message-ID: <878u28wyjw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > This is with wget 1.12 from 2009 :)

Yeah, I guessed this was some kind of crufty RHEL thing ;)

 > Ok, so probably it's fixed meanwhile, but regardless what about the
 > patch which could cover other issues in such tools (not only wget) ?

Small workarounds for legacy tools are ok, as long as they don't add too
much complexity and the issue / version they work around is documented
so we can later remove them again if needed.

-- 
Venlig hilsen,
Peter Korsgaard 
