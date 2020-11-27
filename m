From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2020 18:26:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: use a system-wide slirp
In-Reply-To: <20201112220059.804870-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 12 Nov 2020 23:00:59 +0100")
References: <20201112220059.804870-1-fontaine.fabrice@gmail.com>
Message-ID: <871rgesoc3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use a system-wide slirp now that we switched to the up to date
 > https://gitlab.freedesktop.org/slirp/libslirp

 > qemu already depends on libglib2 so we don't need to add any new
 > dependencies

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
