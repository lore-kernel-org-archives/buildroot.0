From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jun 2017 19:51:20 +0200
Subject: [Buildroot] [PATCH 3/3] docs/manual: document hashes for
 license files
In-Reply-To: <53055153-3e6a-c7ae-0e39-3fcea6476669@lucaceresoli.net>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
 <41013c99543173da1ec547219c7f67e52d323a40.1497772831.git.yann.morin.1998@free.fr>
 <53055153-3e6a-c7ae-0e39-3fcea6476669@lucaceresoli.net>
Message-ID: <20170625175120.GF3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2017-06-23 23:57 +0200, Luca Ceresoli spake thusly:
> 
> On 18/06/2017 10:01, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  docs/manual/adding-packages-directory.txt | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> > index 08f5d42f91..5007d5368d 100644
> > --- a/docs/manual/adding-packages-directory.txt
> > +++ b/docs/manual/adding-packages-directory.txt
[--SNIP--]
> > @@ -476,6 +479,11 @@ strong hash yourself (preferably +sha256+, but not +md5+), and mention
> >  this in a comment line above the hashes.
> >  
> >  .Note
> > +The hashes for license files are used to detect a license change when a
> > +package version is bumped, so a (relatively) weak hash like +sha1+ is
> > +enough for license files.
> 
> I wouldn't spend words to say people can use a weak hash in this case.
> What's the advantage if they use weak hashes? Not computational time,
> hash files are usually small. Not ease of use: typing 'sha256sum' is not
> more difficult than 'md5sum'.
> 
> So I'd just drop that note.

OK, done. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
