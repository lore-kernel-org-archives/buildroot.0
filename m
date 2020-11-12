From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Nov 2020 22:37:34 +0100
Subject: [Buildroot] [PATCH v1] package/wpewebkit: fix compile without
 video support
In-Reply-To: <87sg9ei86d.fsf@dell.be.48ers.dk>
References: <20201110221629.7011-1-ps.report@gmx.net>
 <87sg9ei86d.fsf@dell.be.48ers.dk>
Message-ID: <20201112223734.007ff25d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 12 Nov 2020 22:20:26 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:  
> 
>  > Fixes:
>  >   - https://bugs.busybox.net/show_bug.cgi?id=13306  
> 
>  >       .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ?class WebCore::Settings? has no member named ?setGenericCueAPIEnabled?; did you mean ?setBeaconAPIEnabled??
>  >  page-> settings().setGenericCueAPIEnabled(enabled);
>  >                                     ^~~~~~~~~~~~~~~~~~~~~~~
>  >                                     setBeaconAPIEnabled  
> 
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> Committed, thanks. Don't forget to submit the patch upstream.
> 

Patch seems upstream already superseded by [1] 'Remove remaining alternative
preference setting mechanisms from LayoutTests' (removing the code)...

Regards,
Peter


[1] https://trac.webkit.org/changeset?reponame=webkit&new=269236%40trunk%2FSource%2FWebKit%2FWebProcess%2FInjectedBundle%2FInjectedBundle.cpp&old=269111%40trunk%2FSource%2FWebKit%2FWebProcess%2FInjectedBundle%2FInjectedBundle.cpp
