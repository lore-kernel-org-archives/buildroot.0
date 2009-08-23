From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 23 Aug 2009 13:06:48 +0200
Subject: [Buildroot] Errors when running make saveconfig error
Message-ID: <16E1AEA0F87146C58A3E3D9D15363200@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi
 
I get a lot of errors when i run make saveconfig in the 08 rc2 release:
 
I used this in the 05 release without errors.
 
 
package/config/conf.o: In function `conf_askvalue':
/home/johan/buildroot/package/config/conf.c:80: undefined reference to
`sym_get_type'
/home/johan/buildroot/package/config/conf.c:88: undefined reference to
`sym_is_changable'
package/config/conf.o: In function `get_help':
/home/johan/buildroot/package/config/conf.c:45: undefined reference to
`menu_has_help'
/home/johan/buildroot/package/config/conf.c:46: undefined reference to
`menu_get_help'
package/config/conf.o: In function `conf_sym':
/home/johan/buildroot/package/config/conf.c:166: undefined reference to
`sym_get_type'
/home/johan/buildroot/package/config/conf.c:182: undefined reference to
`sym_tristate_within_range'
/home/johan/buildroot/package/config/conf.c:186: undefined reference to
`menu_has_help'
/home/johan/buildroot/package/config/conf.c:189: undefined reference to
`sym_get_string_value'
/home/johan/buildroot/package/config/conf.c:180: undefined reference to
`sym_tristate_within_range'
/home/johan/buildroot/package/config/conf.c:184: undefined reference to
`sym_tristate_within_range'
/home/johan/buildroot/package/config/conf.c:186: undefined reference to
`menu_has_help'
/home/johan/buildroot/package/config/conf.c:220: undefined reference to
`sym_set_tristate_value'
/home/johan/buildroot/package/config/conf.c:220: undefined reference to
`sym_set_tristate_value'
/home/johan/buildroot/package/config/conf.c:220: undefined reference to
`sym_set_tristate_value'
package/config/conf.o: In function `conf_string':
/home/johan/buildroot/package/config/conf.c:132: undefined reference to
`sym_get_string_value'
/home/johan/buildroot/package/config/conf.c:133: undefined reference to
`sym_get_string_value'
/home/johan/buildroot/package/config/conf.c:151: undefined reference to
`sym_set_string_value'
package/config/conf.o: In function `conf':
/home/johan/buildroot/package/config/conf.c:353: undefined reference to
`menu_is_visible'
/home/johan/buildroot/package/config/conf.c:368: undefined reference to
`menu_get_prompt'
package/config/conf.o: In function `conf_choice':
/home/johan/buildroot/package/config/conf.c:235: undefined reference to
`sym_get_type'
/home/johan/buildroot/package/config/conf.c:237: undefined reference to
`sym_is_changable'
/home/johan/buildroot/package/config/conf.c:263: undefined reference to
`menu_get_prompt'
/home/johan/buildroot/package/config/conf.c:268: undefined reference to
`menu_is_visible'
/home/johan/buildroot/package/config/conf.c:280: undefined reference to
`menu_get_prompt'
/home/johan/buildroot/package/config/conf.c:253: undefined reference to
`menu_get_prompt'
/home/johan/buildroot/package/config/conf.c:293: undefined reference to
`menu_has_help'
/home/johan/buildroot/package/config/conf.c:326: undefined reference to
`menu_is_visible'
/home/johan/buildroot/package/config/conf.c:271: undefined reference to
`menu_get_prompt'
package/config/conf.o: In function `sym_set_choice_value':
/home/johan/buildroot/package/config/lkc.h:142: undefined reference to
`sym_set_tristate_value'
package/config/conf.o: In function `conf_choice':
/home/johan/buildroot/package/config/conf.c:239: undefined reference to
`sym_calc_value'
package/config/conf.o: In function `check_conf':
/home/johan/buildroot/package/config/conf.c:414: undefined reference to
`menu_is_visible'
/home/johan/buildroot/package/config/conf.c:419: undefined reference to
`sym_is_changable'
/home/johan/buildroot/package/config/conf.c:423: undefined reference to
`menu_get_parent_menu'
package/config/conf.o: In function `main':
/home/johan/buildroot/package/config/conf.c:498: undefined reference to
`conf_parse'
/home/johan/buildroot/package/config/conf.c:546: undefined reference to
`conf_read_simple'
/home/johan/buildroot/package/config/conf.c:585: undefined reference to
`rootmenu'
/home/johan/buildroot/package/config/conf.c:584: undefined reference to
`rootmenu'
/home/johan/buildroot/package/config/conf.c:592: undefined reference to
`rootmenu'
/home/johan/buildroot/package/config/conf.c:601: undefined reference to
`conf_get_changed'
/home/johan/buildroot/package/config/conf.c:614: undefined reference to
`conf_write_autoconf'
/home/johan/buildroot/package/config/conf.c:601: undefined reference to
`conf_write'
/home/johan/buildroot/package/config/conf.c:517: undefined reference to
`conf_read'
/home/johan/buildroot/package/config/conf.c:527: undefined reference to
`conf_read'
/home/johan/buildroot/package/config/conf.c:577: undefined reference to
`conf_set_all_new_symbols'
/home/johan/buildroot/package/config/conf.c:568: undefined reference to
`conf_set_all_new_symbols'
/home/johan/buildroot/package/config/conf.c:574: undefined reference to
`conf_set_all_new_symbols'
/home/johan/buildroot/package/config/conf.c:571: undefined reference to
`conf_set_all_new_symbols'
/home/johan/buildroot/package/config/conf.c:580: undefined reference to
`conf_set_all_new_symbols'
/home/johan/buildroot/package/config/conf.c:555: undefined reference to
`conf_get_changed'
/home/johan/buildroot/package/config/conf.c:500: undefined reference to
`conf_get_configname'
/home/johan/buildroot/package/config/conf.c:548: undefined reference to
`conf_read_simple'
/home/johan/buildroot/package/config/conf.c:535: undefined reference to
`conf_read_simple'
/home/johan/buildroot/package/config/conf.c:516: undefined reference to
`conf_get_default_confname'
collect2: ld returned 1 exit status
make: *** [package/config/conf] Error 1
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090823/67c400c6/attachment.htm>
