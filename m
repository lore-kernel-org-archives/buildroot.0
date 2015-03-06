From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Mar 2015 21:11:24 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <20150305232946.3620697e@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
Message-ID: <54F8F0AC.8030707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/2015 07:29 PM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Thu,  5 Mar 2015 17:44:09 -0300, Gustavo Zacarias wrote:
>> Now with support for AD DC, ADS and clustering features.
>> All dropped patches are upstream.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> Ok, I'm going to be annoying on this one, but since this is something
> we generally ask all developers to do, I think we should ask you to do
> it too.
> 
> This cleanup of the indentation is definitely good, but has nothing to
> do with the bump to 4.2.0. It should be part of a separate patch.

Well, it's pointless IMHO to split it, since some options changed and
it's a major bump, does it really make sense?
I won't make a badly-indented 4.2.x package file to fix it later, it
would be pointless. It'll give me one more commit that doesn't do
anything useful.
And "fixing" 4.1.x just to just stomp on it later with the bump would
make no sense either, same case, many changes.
Regards.
