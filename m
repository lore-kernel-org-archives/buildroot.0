From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 1 Dec 2014 22:01:01 +0100
Subject: [Buildroot] [PATCH 1/2] skeleton: make /run a directory
In-Reply-To: <CAGrucu1AtrSqG8_9Z6J0u4dR-Des_9W4xHH-HwguLpoen3vY3A@mail.gmail.com>
References: <1417106898-14444-1-git-send-email-gustavo@zacarias.com.ar>
 <CAGrucu1AtrSqG8_9Z6J0u4dR-Des_9W4xHH-HwguLpoen3vY3A@mail.gmail.com>
Message-ID: <CAHXCMM+J7M99tGUykrxi8MrruVsb34qa3CjHMTsf9XpesHS5vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 1, 2014 at 9:39 PM, Andr? Erdmann <dywi@mailerd.de> wrote:
> Hi,
>
> 2014-11-27 17:48 GMT+01:00 Gustavo Zacarias <gustavo@zacarias.com.ar>:
>> Using a /tmp symlink makes it racy (mode 1777 for /tmp proper) and ugly.
>> While at it also point /var/run to /run until everything is moved there like
>> it should be.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  system/skeleton/run        | 1 -
>>  system/skeleton/run/.empty | 0
>>  system/skeleton/var/run    | 2 +-
>>  3 files changed, 1 insertion(+), 2 deletions(-)
>>  delete mode 120000 system/skeleton/run
>>  create mode 100644 system/skeleton/run/.empty
>>
>
> Shouldn't we link /var/lock to (../)run/lock then?

I think we shuould.

Regards,


-- 
Samuel
