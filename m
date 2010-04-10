From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 10 Apr 2010 00:47:15 +0000 (UTC)
Subject: [Buildroot] bugzilla: problem with "content-disposition" for
	patch files
References: <hpnh5j$4bm$1@dough.gmane.org> <20100410001231.01b7d6f5@surf>
Message-ID: <hpohqj$lae$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-09, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> On Fri, 9 Apr 2010 15:29:55 +0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> This may seem trivial, but it's getting to be pretty annoying.
>> 
>> When you click on a link to a patch file in bubzilla, the
>> content-disposition is sent as "attachment".  This disables the
>> ability of Firefox users to set a default action for that file type.
>> 
>> Can this be fixed?
>
> I agree, this would be nice.

I had hoped there might be a way to fix it in Firefox, but the Firefox
dev's really have a stick up their rear on this one. They're
absolutely positive they're right and everybody else in the world is
wrong.  People have been asking for this to be fixed in Firefox for
years and years (other browsers don't seem to have this "feature"),
but the Firefox devs are sticking to the "one true path" with a
religious fervor.  From the looks of their bug-tracking system, they
must have one dev who's full time job is to change the state of new
reports of this problem to "duplicate" and tell all of the posters of
"me too, please fix this" comments to frack off.

They claim letting users set a default handler for files that are
"content-disposition: attachment" would be "security problem" --
though I've read and was completely unable to follow their reasoning.
If only they put as much effort into plugging other security holes as
they put into defending this feature.

I think it's a case of "security problem" being double-speak for "the
bug doesn't bother us, so we're not going to fix it."

So, the only hope is that bugzilla could be changed.  [I don't really
understand the reasoning behind bugzilla's setting the
content-disposition to "attachment" either, but I haven't looked into
that side of it.]

-- 
Grant
