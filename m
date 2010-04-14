From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 22:29:28 +0100
Subject: [Buildroot] [PATCH 6/7] X11R7.5 - remove all version
 information from Config.in files
In-Reply-To: <4BC61718.3020006@gmail.com>
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
	<1271264806-23336-7-git-send-email-will_wagner@carallon.com>
	<4BC61718.3020006@gmail.com>
Message-ID: <4BC633B8.10201@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/04/2010 20:27, Paulius Zaleckas wrote:
> On 04/14/2010 08:06 PM, Will Wagner wrote:
>> As discussed on the list, don't want to have to change the Config.in
>> file when we bump the version of a package
>>
>> Signed-off-by: Will Wagner<will_wagner@carallon.com>
>
> Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Again I think this is documentation error. Commit to remove it was 
http://cgit.freedesktop.org/xorg/xserver/commit/?id=f4036f6ace5f770f0fe6a6e3dc3749051a81325a

I have been able to build all the packages that previously had any 
dependency on these three libraries so confident they are not longer needed.
