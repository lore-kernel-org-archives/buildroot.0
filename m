From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 00:25:26 +0100
Subject: [Buildroot] [PATCH v5,
 1/1] package/suricata: security bump to version 4.1.5
In-Reply-To: <20191002212427.14014-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Oct 2019 23:24:27 +0200")
References: <20191002212427.14014-1-fontaine.fabrice@gmail.com>
Message-ID: <87lft5ixeh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop second patch (already in version)
 > - Add libmaxminddb dependency and use --disable-libgeoip to prefer
 >   maxminddb over geoip, see:
 >   https://github.com/OISF/suricata/commit/d29072647fa479eb748357a5a75f1ac4206a2cff
 >   https://github.com/OISF/suricata/commit/c55226b7126079d78e4bf5c6fc290242001954a6
 > - Disable sphinx-build (to avoid a build failure)
 > - This release fixes a number of issues found in the 4.1 branch. Some of
 >   the issues are security issues, so upgrading is highly recommended.
 >   See https://suricata-ids.org/2019/09/24/suricata-4-1-5-released

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v4 -> v5 (after review of Thomas Petazzoni):
 >  - Change ifeq order so that libmaxminddb is really preferred over geoip

 > Changes v3 -> v4 (after review of Thomas Petazzoni):
 >  - Add comment about --disable-libgeoip (retrieved from:
 >    https://github.com/OISF/suricata/commit/c55226b7126079d78e4bf5c6fc290242001954a6)

 > Changes v2 -> v3:
 >  - Fix typo: "else if" -> "else ifeq"

 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Fix geoip/maxminddb handling

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
