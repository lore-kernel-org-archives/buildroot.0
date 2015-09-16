From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Sep 2015 12:00:29 +0300
Subject: [Buildroot] [PATCH 1/6] python-urwid: bump version and add
	checksums
In-Reply-To: <87oah6avor.fsf@dell.be.48ers.dk>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
 <20150901100816.GM17874@tarshish> <87oah6avor.fsf@dell.be.48ers.dk>
Message-ID: <20150916090029.GJ11632@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Sep 13, 2015 at 10:52:36PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > On Tue, Sep 01, 2015 at 10:10:27AM +0200, Christophe Vu-Brugier wrote:
>  >> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>  >> ---
>  >> package/python-urwid/python-urwid.hash | 3 +++
>  >> package/python-urwid/python-urwid.mk   | 2 +-
>  >> 2 files changed, 4 insertions(+), 1 deletion(-)
>  >> create mode 100644 package/python-urwid/python-urwid.hash
>  >> 
>  >> diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
>  >> new file mode 100644
>  >> index 0000000..2b18082
>  >> --- /dev/null
>  >> +++ b/package/python-urwid/python-urwid.hash
>  >> @@ -0,0 +1,3 @@
>  >> +# md from
>  >> https://pypi.python.org/pypi?:action=show_md5&digest=a989acd54f4ff1a554add464803a9175,
>  >> sha256 locally computed
> 
>  > This is weird. You put the MD5 in the URL to retrieve the same MD5? Is there a 
>  > way to lookup the MD5 using the package name? If not, I guess that 
>  > https://pypi.python.org/pypi/urwid/1.3.0 would be good enough.
> 
> Yeah, the upstream pypi hash URLs are kind of odd. These are the
> official links though.

The .hash file is all about trust, IMO. Seeing md5 that is an identity 
function of the URL just makes me feel uneasy. The package URL at 
https://pypi.python.org/pypi/urwid/1.3.0 contains the same link (next to the 
file name), but it looks less easy to trick.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
