From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 30 Oct 2015 12:57:08 -0400
Subject: [Buildroot] [PATCH 1/1] openssl: remove patch's git-hash to
 support fat/ntfs systems
In-Reply-To: <56339E03.4050303@mind.be>
References: <1446218867-6128-1-git-send-email-james.knight@rockwellcollins.com>
 <56339E03.4050303@mind.be>
Message-ID: <CALe+oY-tjfi_UmiL6kS6FmSbX2TiQhFW=E6yKjs+aXYyFuO21Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, Oct 30, 2015 at 12:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> I think that one trumps supporting FAT or NTFS as your DL_DIR filesystem, so
> that's a NACK from me.

Agreed.

I'll try to find a way to work around the setup I have then, maybe try
a sanitation method (like you've suggested). I'll mark the patch as
rejected. I'd be curious if anyone else has any other comments on
this.
