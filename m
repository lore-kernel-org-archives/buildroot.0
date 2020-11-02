From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 2 Nov 2020 20:43:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: bump to version 3.4.0
In-Reply-To: <20201101163057.1944742-1-fontaine.fabrice@gmail.com>
References: <20201101163057.1944742-1-fontaine.fabrice@gmail.com>
Message-ID: <20201102194306.GB41334@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually, c-ares are required since v3.3.0
(commit 451a241e50 Add c-ares to the required library list.)

You still keep it as optional dependency, thus by default build fails.

Kind regards,
Petr
