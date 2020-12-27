From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:11:11 +0100
Subject: [Buildroot] [PATCH 3/3] package/dhcpcd: add udev optional
 dependency
In-Reply-To: <20201226171745.2414764-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 26 Dec 2020 18:17:45 +0100")
References: <20201226171745.2414764-1-fontaine.fabrice@gmail.com>
 <20201226171745.2414764-3-fontaine.fabrice@gmail.com>
Message-ID: <8735zrd5y8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > udev is an optional dependency (enabled by default) since version 6.1.0:
 > https://github.com/rsmarples/dhcpcd/commit/12bbc8cb5c7507be15a7e0af4140c3d81125c46c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
