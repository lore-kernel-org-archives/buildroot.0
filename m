From: Michael Rommel <rommel@layer-7.net>
Date: Fri, 6 Sep 2013 16:38:33 +0200
Subject: [Buildroot] [RFC] Unification of package comments on wchar,
	largefile, c++ support, thread, ... support
In-Reply-To: <CAAXf6LU0aHEC3KH_5ZUN+ffXGAiDanfX+Qj2RZG5bruzPjtJkQ@mail.gmail.com>
References: <CAAXf6LV7wB6_RsufRWD6s7-viuYheasMHJWqDAGtu6BmPpZBdw@mail.gmail.com>
 <CAAHaz6E16CcRV1gpvFA3KvPfvf78JjqywVJFZxCgs5YOCAeF2g@mail.gmail.com>
 <CAAXf6LWyOHWDxPHkwga4mCy3UaCu93XEvAaXBpRz86wrQyPfnw@mail.gmail.com>
 <20130906142807.44427db7@skate>
 <CAAXf6LU0aHEC3KH_5ZUN+ffXGAiDanfX+Qj2RZG5bruzPjtJkQ@mail.gmail.com>
Message-ID: <4E721931-1126-44EF-A60C-EFB02FDBAEA6@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sep 6, 2013, at 16:34 , Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

>> We have the choice between:
>> 
>> (1) All lower-case
>> 
>> comment "directfb needs a toolchain w/ ipv6, rpc, thread, wchar"
>> 
>> (2) Lower-case, except when it doesn't make sense (acronyms)
>> 
>> comment "directfb needs a toolchain w/ IPv6, RPC, thread, wchar"
>> 
>> (3) All upper-case
>> 
>> comment "directfb needs a toolchain w/ IPv6, RPC, THREAD, WCHAR"
> 
> All options are fine for me. I think the most important thing is that
> the user can map the comment onto the necessary configuration options
> in the toolchain menu.
> The second one is most balanced, I'm slightly leaning towards that.


I would like to have guidance for long package names, too, because I ran into the limit
for python-pyzmq which alone takes up considerable space and I needed three comments
to accommodate all...

  Michael.

-- 
Michael Rommel, Erlangen, Germany

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/95e61ffa/attachment.html>
