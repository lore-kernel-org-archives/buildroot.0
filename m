From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:13:47 +0200
Subject: [Buildroot] [PATCH v2 1/4] board/raspberrypi/post-image.sh: add
 multi arg support
In-Reply-To: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
References: <1500123032-9198-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <8b056f3f-7ff1-191c-e0e7-bce66e7af9ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-07-17 14:50, Erik Stromdahl wrote:
> Add possibility to supply multiple arguments to
> post-image.sh
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

 Applied to master, thanks, with one little change...

[snip]
> -	fi
> -	;;
> +		fi
> +		;;
>  esac

 I indented the esac.

 Regards,
 Arnout

>  
> +done
> +
>  rm -rf "${GENIMAGE_TMP}"
>  
>  genimage                           \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
