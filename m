From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2019 23:27:58 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libnetconf2: fixup the 'v' prefix in the version
In-Reply-To: <20191024181012.13775-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 24 Oct 2019 20:10:12 +0200")
References: <20191024181012.13775-1-fontaine.fabrice@gmail.com>
Message-ID: <87pnil4yw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In order for the libnetconf2 version to match what is given by
 > release-monitoring.org, the 'v' prefix should be encoded in
 > LIBNETCONF2_SITE and not LIBNETCONF2_VERSION.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - fix typo in commit message (luvi -> libnetconf2)

Committed, thanks.

-- 
Bye, Peter Korsgaard
