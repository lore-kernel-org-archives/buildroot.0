From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Sep 2010 23:19:43 +0200
Subject: [Buildroot] Introduction of mpd into buildroot ?
In-Reply-To: <20100923000922.57de215a@surf> (Thomas Petazzoni's message of
	"Thu, 23 Sep 2010 00:09:22 +0100")
References: <AANLkTimZa473TfBgFhoXMhR_fiusyduFvdo-YuMzs84T@mail.gmail.com>
	<20100923000922.57de215a@surf>
Message-ID: <87vd5w6tu8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> So I would be inclined to create a patch into
 >> package/multimedia/libmad to add this file during mpd
 >> installation. Is it the better way to do this ?

 Thomas> Yes, sounds good. An even better thing would be to create such
 Thomas> a patch *and* to submit it to the upstream libmad project so
 Thomas> that hopefully a future version of libmad will contain the
 Thomas> pkg-config file.

While that is good advice in general, I don't think it will work in the
libmad case as that's pretty dead upstream. The latest (beta) release
was in 2004.

 >> Well, if mpd has never been added into buildroot I'm interested to work on
 >> it.

 Thomas> I haven't heard of any effort to package mpd, so feel free to
 Thomas> work on it!

Yes please. It would be a good companion to the libmpd stuff we already
have.

-- 
Bye, Peter Korsgaard
