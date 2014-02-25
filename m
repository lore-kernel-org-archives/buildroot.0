From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Feb 2014 07:22:34 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-23
In-Reply-To: <20140224213601.6c287457@skate>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
 <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
 <20140224213601.6c287457@skate>
Message-ID: <20140225052234.GO4869@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 24, 2014 at 09:36:01PM +0100, Thomas Petazzoni wrote:
> > >               wireshark-1.10.5 | 1
> >     xtensa |               wireshark-1.10.5 | NOK |
> > http://autobuild.buildroot.net/results/3bbba270745d96a08ff6eb98f9f3d39ca3a3ea9e/
> > 
> > {standard input}:119517: Error: operand 1 of 'j' has out of range
> > value '4294825646'
> > {standard input}:119521: Error: operand 1 of 'j' has out of range
> > value '4294828543'
> > {standard input}:119525: Error: operand 1 of 'j' has out of range
> > value '4294829836'
> > {standard input}:119529: Error: operand 1 of 'j' has out of range
> > value '4294830953'
> > {standard input}:119533: Error: operand 1 of 'j' has out of range
> > value '4294832702'
> > {standard input}:119537: Error: operand 1 of 'j' has out of range
> > value '4294834399'
> > {standard input}:119541: Error: operand 1 of 'j' has out of range
> > value '4294835783'
> 
> Compiler problem. Should we disable wireshark for now?

This problem appeared after the last wireshark version bump, and may as well 
disappear after the next. The same goes for kmod 
(http://autobuild.buildroot.net/results/1a6/1a6e7119feeb8c6098daf0d5cdc41aa778a30693/) 
and mplayer 
(http://autobuild.buildroot.net/results/9d2/9d2cf930d51274e119a98f63c06741bf2014ca64/). 
Disabling wireshark on xtensa for now is OK if it's enabled again on the next 
version update.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
