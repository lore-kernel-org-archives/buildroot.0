From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 8 Feb 2015 15:22:51 +0100
Subject: [Buildroot] [PATCH] glibc: bump version to 2.21
In-Reply-To: <20150208101809.GA4028@free.fr>
References: <1423333238-47401-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150208101809.GA4028@free.fr>
Message-ID: <54D7713B.1040402@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

when glibc-2.20 was added, it was done in the same way: adding 2.20,
removing 2.18 and setting 2.19 as default. All in the same patch, and
nobody complained. See:

http://git.buildroot.net/buildroot/commit/?id=f660cfd043b898c9b9eb5fc5ccc90335d6b334f5

Why should I do it in separate patches now?
--
Vincent
