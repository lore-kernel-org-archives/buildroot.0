From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:15:20 +0100
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <CAHkwnC_PjANbN1MN7uXUq2wBjaR-Z62KuWeE3bMFrJ-7oWXBww@mail.gmail.com>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
 <CAHkwnC-cVh1fKVKyR=RhWv+tQgRVeQomt0dL1Z0TW_cbnyQ_+w@mail.gmail.com>
 <20150307173234.57c8bf4f@free-electrons.com>
 <CAHkwnC_PjANbN1MN7uXUq2wBjaR-Z62KuWeE3bMFrJ-7oWXBww@mail.gmail.com>
Message-ID: <20150308081520.1a6e9fc7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sat, 7 Mar 2015 18:01:41 +0100, Fabio Porcedda wrote:

> I don't know exactly but the libevas seems dead, the last change in
> the git repository was made 15 months ago.

The EFL stuff in Buildroot needs a complete update: most of the
EFL libraries have been merged into one single project/tarball. So many
of the EFL related packages in Buildroot should be removed, and the
main EFL library bumped to a higher version.

> https://git.enlightenment.org/legacy/evas.git/

See the "legacy" in this URL ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
