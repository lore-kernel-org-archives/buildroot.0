From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 25 Jul 2012 15:27:28 +0100
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <20120725161103.0ee904c6@skate>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
 <20120725102242.77a06eca@skate>
 <CAHt8ZCPHv7MR=WAvPRL5PxiTp=NsgDkhWKFusCEYgxiBtZPWXg@mail.gmail.com>
 <20120725105508.1c7179df@skate>
 <CAHt8ZCOxSscd=-b4OMYqXtt3a0Y3hZ5276T4pOfk-JR+pQOXyw@mail.gmail.com>
 <20120725161103.0ee904c6@skate>
Message-ID: <CAHt8ZCMoxjWASrHZ0JYMtnytZ3zutWc3aNRAxRyjSwtnaJABmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25 July 2012 15:11, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> For now, I would suggest that we leave the Python support in gpsd on
> the side, until someone who actually needs it steps up to fix the
> issues. So I'll force python=no unconditionally. Do you agree with this?

Yes, absolutely.

Simon.
