From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 25 Oct 2019 08:44:08 -0300
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix qemu 3.1.1.1 to build
 with >glib-2.29
In-Reply-To: <20191025104257.3178713-1-pmatos@igalia.com>
References: <20191025104257.3178713-1-pmatos@igalia.com>
Message-ID: <CAJ4jsadP-K4mnUZrzVKfBdzqCDQ2tar7yGJEFV8x+hs8GdbTMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s/glib-2.29/glibc-2.29/ in the subject.

-- 
Carlos Santos <unixmania@gmail.com>
