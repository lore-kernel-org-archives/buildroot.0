From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 14:49:32 +0100
Subject: [Buildroot] [PATCH 02/10] dash: bump to 0.5.8-2
In-Reply-To: <20141114144256.7486638c@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 14 Nov 2014 14:42:56 +0100")
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-3-git-send-email-gustavo@zacarias.com.ar>
 <20141114141548.55205c95@free-electrons.com>
 <87bno9hpfv.fsf@dell.be.48ers.dk>
 <20141114144256.7486638c@free-electrons.com>
Message-ID: <87389lhoyb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > Peter, this one should probably go in 2014.11.
 >> 
 >> Why? Is it security related? I don't see anything special in the
 >> changelog. In fact, I don't see anything affecting us at all:
 >> 
 >> http://metadata.ftp-master.debian.org/changelogs//main/d/dash/dash_0.5.8-2_changelog

 > I should have said: s/should/could/. I believe it's a minor update, and
 > it's adding hash files, so it's fine for 2014.11. But it's your call :)

Ok. It only updates the .hash, we already have it for -1.

Gustavoz, what is the reason for the bump? According to the changelog
the only difference is in the debian packaging (should we also pass
--disable-lineno?)

-- 
Venlig hilsen,
Peter Korsgaard 
