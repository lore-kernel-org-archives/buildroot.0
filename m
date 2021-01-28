From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:54:21 +0100
Subject: [Buildroot] [PATCH v3,6/6] package/libupnp18: drop package
In-Reply-To: <20210125194949.1173139-6-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 25 Jan 2021 20:49:49 +0100")
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
 <20210125194949.1173139-6-fontaine.fabrice@gmail.com>
Message-ID: <87pn1o25xu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop libupnp18 as libupnp has been bumped to 1.14.x and 1.8.x will not
 > been fixed against CallStranger a.k.a. CVE-2020-12695

 > mpd and vlc are already compliant with libupnp 1.14.x (i.e those
 > packages use UpnpInit2 instead of the deprecated UpnpInit)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
