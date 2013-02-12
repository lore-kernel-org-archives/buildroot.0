From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 12 Feb 2013 12:08:07 +0200
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
In-Reply-To: <20130211151429.682ea550@skate>
References: <1360585826-17996-1-git-send-email-alexander.lukichev@gmail.com>
 <20130211134547.02bedae4@skate> <5118EF9A.1030106@gmail.com>
 <20130211151429.682ea550@skate>
Message-ID: <511A1487.2060507@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas, All!

On 02/11/2013 04:14 PM, Thomas Petazzoni wrote:
>>> unclear if we should choose libpgm or openpgm. Does the openpgm
>>> projects delivers something else than libpgm?
>> Not as far as I know.

Well, actually yes. It's mostly libpgm but there are also bindings for Perl and GStreamer.

> Then maybe we want to call the package libpgm ?
It is referenced from ZeroMQ (in everything, including scripts and documentation) as OpenPGM. I don't know about other packages using it, though.
It is also referenced from inside the package itself (the subdir is openpgm/pgm/ etc). It seems that only the archive and installed library files have libpgm in their names: everything else is named openpgm.
So, I'll do what you and the community advise but I'd rather call it "OpenPGM implementation of libpgm".

--
Best regards,
  Alexander Lukichev
