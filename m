From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 1 Apr 2014 10:39:01 +0200
Subject: [Buildroot] [PATCH 5/6] infra: add to luarocks support for
 top-level parallel make
In-Reply-To: <CAB0FRsuRnHaq0SwMk3LZGAOHMSTn3Y5NbLXdUmUDYmrJZ216hg@mail.gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-6-git-send-email-fabio.porcedda@gmail.com>
 <CAB0FRsuRnHaq0SwMk3LZGAOHMSTn3Y5NbLXdUmUDYmrJZ216hg@mail.gmail.com>
Message-ID: <CAHkwnC-kpQv3QJbiNhyTTXHYCJZK8d4itAPFV0JzC3EX=N8=ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 11, 2014 at 8:42 PM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
> 2014-03-11 13:17 GMT+01:00 Fabio Porcedda <fabio.porcedda@gmail.com>:
>> The host-luarock dependency is not always satisfied for the extract
>> phase because the %-extract target is not anymore in the dependency
>> chain.
>> To be sure that the dependency is satfied add the dependency to the
>
> typo: satisfied

I've corrected the type, thanks.

Regards
-- 
Fabio Porcedda
