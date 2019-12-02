From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 12:43:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/openpgm: fix version name to
 make Autobuild happy
In-Reply-To: <20191201124913.5295-1-alexander.lukichev@gmail.com> (Alexander
 Lukichev's message of "Sun, 1 Dec 2019 14:49:13 +0200")
References: <20191201124913.5295-1-alexander.lukichev@gmail.com>
Message-ID: <87a78bosuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:

 > Autobuild has a "version bump" checker that sends message to a
 > package maintainer if its declared version does not match the
 > latest one on release-monitoring.org. In case of openpgm the
 > version _is_ the latest one, but mismatch is caused by including
 > a "release-" prefix into tags on upstream and excluding them on
 > other websites when referring to the package's version.

 > This also fixes sha256 value for the downloaded archive.

 > Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>

Committed after rewording the commit message somewhat, thanks.

-- 
Bye, Peter Korsgaard
