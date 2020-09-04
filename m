From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2020 11:49:06 +0200
Subject: [Buildroot] Backport fix for systemd to 2020.02.x
In-Reply-To: <CA+fik51zZu=eWbpP-WGwAysVUef7nLDuFFW_fotsSy=OyFNzVA@mail.gmail.com>
 (Brandon Maier's message of "Tue, 1 Sep 2020 17:56:40 -0500")
References: <CA+fik51zZu=eWbpP-WGwAysVUef7nLDuFFW_fotsSy=OyFNzVA@mail.gmail.com>
Message-ID: <87sgbxna7h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brandon" == Brandon Maier <brandon.maier@rockwellcollins.com> writes:

 > Hi, on the master branch, commit  65b637 ("package/systemd: move preset-all
 > HOOK to fakeroot stage") fixes the systemd package so that the "systemctl
 > preset-all" runs after ROOFS_OVERLAY and POST_BUILD_SCRIPT, and picks up on
 > preset and service files installed by them. Could that commit be added to
 > 2020.02.x as well?

Thanks for the heads up, cherry picked for 2020.02.x and 2020.05.x.

-- 
Bye, Peter Korsgaard
