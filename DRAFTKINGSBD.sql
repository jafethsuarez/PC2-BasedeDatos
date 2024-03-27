PGDMP  &                    |            DraftKingsBD    16.2    16.2 <    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    16398    DraftKingsBD    DATABASE     �   CREATE DATABASE "DraftKingsBD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "DraftKingsBD";
                postgres    false            �            1259    16400    team    TABLE     \   CREATE TABLE public.team (
    id_team integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.team;
       public         heap    postgres    false            �            1259    16399    equipos_id_equipo_seq    SEQUENCE     �   CREATE SEQUENCE public.equipos_id_equipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.equipos_id_equipo_seq;
       public          postgres    false    216            .           0    0    equipos_id_equipo_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.equipos_id_equipo_seq OWNED BY public.team.id_team;
          public          postgres    false    215            �            1259    16433    player_statistics    TABLE     +  CREATE TABLE public.player_statistics (
    id_player_statistics integer NOT NULL,
    player_id integer,
    fluctuation_value character varying(5),
    average numeric(5,2),
    score_player integer,
    points_antepenultimate_match integer,
    game_played integer,
    minutes_played integer,
    goals integer,
    assists integer,
    assists_without_goal integer,
    balls_into_area integer,
    clearances integer,
    dribbles integer,
    kicks_to_goal integer,
    recovered_balls integer,
    possession_loss integer,
    penaltis_failed integer,
    goals_against integer,
    red_cards integer,
    ball_stop integer,
    penalties_made integer,
    yellow_cards integer,
    second_yellow_card_match integer,
    penalties_caused integer,
    penalties_stopped integer,
    own_goals integer
);
 %   DROP TABLE public.player_statistics;
       public         heap    postgres    false            �            1259    16432 .   estadisticasjugador_id_estadisticasjugador_seq    SEQUENCE     �   CREATE SEQUENCE public.estadisticasjugador_id_estadisticasjugador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.estadisticasjugador_id_estadisticasjugador_seq;
       public          postgres    false    222            /           0    0 .   estadisticasjugador_id_estadisticasjugador_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.estadisticasjugador_id_estadisticasjugador_seq OWNED BY public.player_statistics.id_player_statistics;
          public          postgres    false    221            �            1259    16407    player    TABLE     �  CREATE TABLE public.player (
    id_player integer NOT NULL,
    name character varying(255),
    foot character varying(50),
    short_name_position character varying(50),
    age integer,
    market_value_mister_fantasy numeric(22,2),
    nationality character varying(50),
    image_url character varying(255),
    team_id integer,
    shirt_number character varying(50),
    team character varying(225)
);
    DROP TABLE public.player;
       public         heap    postgres    false            �            1259    16406    jugador_id_jugador_seq    SEQUENCE     �   CREATE SEQUENCE public.jugador_id_jugador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.jugador_id_jugador_seq;
       public          postgres    false    218            0           0    0    jugador_id_jugador_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.jugador_id_jugador_seq OWNED BY public.player.id_player;
          public          postgres    false    217            �            1259    16421    prediction_results    TABLE     �   CREATE TABLE public.prediction_results (
    id_result integer NOT NULL,
    player_id integer,
    old_score integer,
    predicted_score integer,
    old_price bigint,
    predicted_price bigint,
    prediction_date date
);
 &   DROP TABLE public.prediction_results;
       public         heap    postgres    false            �            1259    16420 )   resultados_predicciones_id_resultados_seq    SEQUENCE     �   CREATE SEQUENCE public.resultados_predicciones_id_resultados_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.resultados_predicciones_id_resultados_seq;
       public          postgres    false    220            1           0    0 )   resultados_predicciones_id_resultados_seq    SEQUENCE OWNED BY     n   ALTER SEQUENCE public.resultados_predicciones_id_resultados_seq OWNED BY public.prediction_results.id_result;
          public          postgres    false    219            �            1259    16454    tokens    TABLE     �   CREATE TABLE public.tokens (
    id_tokens integer NOT NULL,
    user_id integer,
    token character varying(255),
    date_expiration timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            �            1259    16453    tokens_id_tokens_seq    SEQUENCE     �   CREATE SEQUENCE public.tokens_id_tokens_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tokens_id_tokens_seq;
       public          postgres    false    226            2           0    0    tokens_id_tokens_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tokens_id_tokens_seq OWNED BY public.tokens.id_tokens;
          public          postgres    false    225            �            1259    16445    user    TABLE     �   CREATE TABLE public."user" (
    id_user integer NOT NULL,
    email character varying(255),
    password character varying(255),
    creation_date date
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16466    user_player    TABLE     �   CREATE TABLE public.user_player (
    id_user_player integer NOT NULL,
    user_id integer,
    player_id integer,
    date date
);
    DROP TABLE public.user_player;
       public         heap    postgres    false            �            1259    16444    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    224            3           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public."user".id_user;
          public          postgres    false    223            �            1259    16465 ,   usuariosxjugadores_id_usuariosxjugadores_seq    SEQUENCE     �   CREATE SEQUENCE public.usuariosxjugadores_id_usuariosxjugadores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.usuariosxjugadores_id_usuariosxjugadores_seq;
       public          postgres    false    228            4           0    0 ,   usuariosxjugadores_id_usuariosxjugadores_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.usuariosxjugadores_id_usuariosxjugadores_seq OWNED BY public.user_player.id_user_player;
          public          postgres    false    227            o           2604    16410    player id_player    DEFAULT     v   ALTER TABLE ONLY public.player ALTER COLUMN id_player SET DEFAULT nextval('public.jugador_id_jugador_seq'::regclass);
 ?   ALTER TABLE public.player ALTER COLUMN id_player DROP DEFAULT;
       public          postgres    false    217    218    218            q           2604    16436 &   player_statistics id_player_statistics    DEFAULT     �   ALTER TABLE ONLY public.player_statistics ALTER COLUMN id_player_statistics SET DEFAULT nextval('public.estadisticasjugador_id_estadisticasjugador_seq'::regclass);
 U   ALTER TABLE public.player_statistics ALTER COLUMN id_player_statistics DROP DEFAULT;
       public          postgres    false    222    221    222            p           2604    16424    prediction_results id_result    DEFAULT     �   ALTER TABLE ONLY public.prediction_results ALTER COLUMN id_result SET DEFAULT nextval('public.resultados_predicciones_id_resultados_seq'::regclass);
 K   ALTER TABLE public.prediction_results ALTER COLUMN id_result DROP DEFAULT;
       public          postgres    false    219    220    220            n           2604    16403    team id_team    DEFAULT     q   ALTER TABLE ONLY public.team ALTER COLUMN id_team SET DEFAULT nextval('public.equipos_id_equipo_seq'::regclass);
 ;   ALTER TABLE public.team ALTER COLUMN id_team DROP DEFAULT;
       public          postgres    false    215    216    216            s           2604    16457    tokens id_tokens    DEFAULT     t   ALTER TABLE ONLY public.tokens ALTER COLUMN id_tokens SET DEFAULT nextval('public.tokens_id_tokens_seq'::regclass);
 ?   ALTER TABLE public.tokens ALTER COLUMN id_tokens DROP DEFAULT;
       public          postgres    false    226    225    226            r           2604    16448    user id_user    DEFAULT     t   ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    223    224    224            t           2604    16469    user_player id_user_player    DEFAULT     �   ALTER TABLE ONLY public.user_player ALTER COLUMN id_user_player SET DEFAULT nextval('public.usuariosxjugadores_id_usuariosxjugadores_seq'::regclass);
 I   ALTER TABLE public.user_player ALTER COLUMN id_user_player DROP DEFAULT;
       public          postgres    false    228    227    228                      0    16407    player 
   TABLE DATA           �   COPY public.player (id_player, name, foot, short_name_position, age, market_value_mister_fantasy, nationality, image_url, team_id, shirt_number, team) FROM stdin;
    public          postgres    false    218   �M       !          0    16433    player_statistics 
   TABLE DATA           �  COPY public.player_statistics (id_player_statistics, player_id, fluctuation_value, average, score_player, points_antepenultimate_match, game_played, minutes_played, goals, assists, assists_without_goal, balls_into_area, clearances, dribbles, kicks_to_goal, recovered_balls, possession_loss, penaltis_failed, goals_against, red_cards, ball_stop, penalties_made, yellow_cards, second_yellow_card_match, penalties_caused, penalties_stopped, own_goals) FROM stdin;
    public          postgres    false    222   ��                 0    16421    prediction_results 
   TABLE DATA           �   COPY public.prediction_results (id_result, player_id, old_score, predicted_score, old_price, predicted_price, prediction_date) FROM stdin;
    public          postgres    false    220   ц                 0    16400    team 
   TABLE DATA           -   COPY public.team (id_team, name) FROM stdin;
    public          postgres    false    216   �       %          0    16454    tokens 
   TABLE DATA           L   COPY public.tokens (id_tokens, user_id, token, date_expiration) FROM stdin;
    public          postgres    false    226   ߇       #          0    16445    user 
   TABLE DATA           I   COPY public."user" (id_user, email, password, creation_date) FROM stdin;
    public          postgres    false    224   ��       '          0    16466    user_player 
   TABLE DATA           O   COPY public.user_player (id_user_player, user_id, player_id, date) FROM stdin;
    public          postgres    false    228   �       5           0    0    equipos_id_equipo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.equipos_id_equipo_seq', 660, true);
          public          postgres    false    215            6           0    0 .   estadisticasjugador_id_estadisticasjugador_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.estadisticasjugador_id_estadisticasjugador_seq', 1, false);
          public          postgres    false    221            7           0    0    jugador_id_jugador_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.jugador_id_jugador_seq', 3402, true);
          public          postgres    false    217            8           0    0 )   resultados_predicciones_id_resultados_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.resultados_predicciones_id_resultados_seq', 1, false);
          public          postgres    false    219            9           0    0    tokens_id_tokens_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tokens_id_tokens_seq', 1, false);
          public          postgres    false    225            :           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public          postgres    false    223            ;           0    0 ,   usuariosxjugadores_id_usuariosxjugadores_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.usuariosxjugadores_id_usuariosxjugadores_seq', 1, false);
          public          postgres    false    227            v           2606    16405    team equipos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.team
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id_team);
 ;   ALTER TABLE ONLY public.team DROP CONSTRAINT equipos_pkey;
       public            postgres    false    216            ~           2606    16438 *   player_statistics estadisticasjugador_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.player_statistics
    ADD CONSTRAINT estadisticasjugador_pkey PRIMARY KEY (id_player_statistics);
 T   ALTER TABLE ONLY public.player_statistics DROP CONSTRAINT estadisticasjugador_pkey;
       public            postgres    false    222            z           2606    16414    player jugador_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.player
    ADD CONSTRAINT jugador_pkey PRIMARY KEY (id_player);
 =   ALTER TABLE ONLY public.player DROP CONSTRAINT jugador_pkey;
       public            postgres    false    218            |           2606    16426 /   prediction_results resultados_predicciones_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.prediction_results
    ADD CONSTRAINT resultados_predicciones_pkey PRIMARY KEY (id_result);
 Y   ALTER TABLE ONLY public.prediction_results DROP CONSTRAINT resultados_predicciones_pkey;
       public            postgres    false    220            x           2606    16483    team team_name_unique 
   CONSTRAINT     P   ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_name_unique UNIQUE (name);
 ?   ALTER TABLE ONLY public.team DROP CONSTRAINT team_name_unique;
       public            postgres    false    216            �           2606    16459    tokens tokens_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id_tokens);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    226            �           2606    16452    user usuario_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT usuario_pkey;
       public            postgres    false    224            �           2606    16471 #   user_player usuariosxjugadores_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.user_player
    ADD CONSTRAINT usuariosxjugadores_pkey PRIMARY KEY (id_user_player);
 M   ALTER TABLE ONLY public.user_player DROP CONSTRAINT usuariosxjugadores_pkey;
       public            postgres    false    228            �           2606    16439 5   player_statistics estadisticasjugador_id_jugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player_statistics
    ADD CONSTRAINT estadisticasjugador_id_jugador_fkey FOREIGN KEY (player_id) REFERENCES public.player(id_player);
 _   ALTER TABLE ONLY public.player_statistics DROP CONSTRAINT estadisticasjugador_id_jugador_fkey;
       public          postgres    false    222    4730    218            �           2606    16415    player jugador_equipo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player
    ADD CONSTRAINT jugador_equipo_id_fkey FOREIGN KEY (team_id) REFERENCES public.team(id_team);
 G   ALTER TABLE ONLY public.player DROP CONSTRAINT jugador_equipo_id_fkey;
       public          postgres    false    216    4726    218            �           2606    16427 :   prediction_results resultados_predicciones_id_jugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prediction_results
    ADD CONSTRAINT resultados_predicciones_id_jugador_fkey FOREIGN KEY (player_id) REFERENCES public.player(id_player);
 d   ALTER TABLE ONLY public.prediction_results DROP CONSTRAINT resultados_predicciones_id_jugador_fkey;
       public          postgres    false    220    4730    218            �           2606    16460    tokens tokens_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_id_usuario_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id_user);
 G   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_id_usuario_fkey;
       public          postgres    false    4736    226    224            �           2606    16477 .   user_player usuariosxjugadores_id_jugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_player
    ADD CONSTRAINT usuariosxjugadores_id_jugador_fkey FOREIGN KEY (player_id) REFERENCES public.player(id_player);
 X   ALTER TABLE ONLY public.user_player DROP CONSTRAINT usuariosxjugadores_id_jugador_fkey;
       public          postgres    false    4730    228    218            �           2606    16472 .   user_player usuariosxjugadores_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_player
    ADD CONSTRAINT usuariosxjugadores_id_usuario_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id_user);
 X   ALTER TABLE ONLY public.user_player DROP CONSTRAINT usuariosxjugadores_id_usuario_fkey;
       public          postgres    false    228    4736    224                  x��}�rɱ���Q�~����h6	F���Lf�*H2QIeU�E��]j�����?6�U����] �N�Lj����O���*J�����y3�t�bَ��ݰ8{�~��BY��b�z�������f�m�?������e�r36����xߌ_7/7�ﮆ~����o��_���}�����	�{鼌1J_~[�����ʅ\(�8����������.޾|q�]uM�ztq�q��"�Z��Q�� �hlH
�-���ūv���n��E���m׎�a���B녪��� ���1L�a�/_��9���cz��f!C-D���)iǮM�~���O�8�c�]�gF1j��x��̌$�ь>�!�7}�6�����%����/��&����pP.���l�!���$�|ԓy�����G��}�����1�o��U�>ee��������|u'�C3��O�t���B���wR�Z�&�e��2D-�}�u۲ﭦ��'�*��cΟ�޺���^�-T�_A:�kV� ��S��"�c|�⪻^���̀��S:��uy���q���v}�d&}��3ޘ��^�����E����H��ݶ���ޒI�;#���?
� �g~�9����}̽#}�~a�!2B�'D��w�=�`��/_|�f�u� �ؘ�
|����Z����)���g�4����C׬�/25/�*<�'����I|����M�a	p�Q@^����E����_+4�Kp��v͏H/B=@�K������)s@�Y���gx?n;x��k` �@���n΁����-i��ՙ�+8��Yf���#�=����Ck}J*�l���s"J'�u��9Ņ�	�E��ă�F�؃���ñ�-2=S�Ƚ �g�sR�${S $�7�|�o�3��NT�LA��ɹh�+��h�&�}2�����]�W	��׎q6~c���۬۞� ���[{���mw���dg��
�ٶJ$���O 4@p��% 3bq
����뻛m�ԥ�����<�`�����Qhr���o����_�AQd����2C��G!�Ż�k˂�b�}qF���d�:�tG��>w��+�3��a�iW��8<;l^H�C�7-��Shߙ��}��^�Y����&D�:9N���aЎ�����|����f�*;8���� 7s��K���Tax��?��!��al
��>����܌��F3��g�̣�}耥s7��b�	
���Q�b��"Ӝ�ߚ���_6?��n�/^5_�c<�V�we^�ϢZ?���d���ב�73mB	����Vhr~��4+��י!��_)�:�f.M-@D����(,��׋f�l��uE�\���u��m�lt@%"�
�P�Y�4���*�m`q��=8�I&wp��[0�g�D0v�&ŬM�)�w�l{F�#c�'�m��t�R �r2hnF�C;�&X���t�Уa��������*0!x���<�R{
͢�	~�a=d��ъ�W�]��Uv�ǯ�R6��a�sa��0��Д�t�F�{�(;:��A^߷���?�e׮7���<�o�lǿo���WA0���W^E�f�0V�z����*��u,� �D'����Q�f#:L��&��c
���1�Ri82�@�Q�z�O�T����Oz_C��I'�>S�{��z'����VC+�@_�ͺ��{M����G�O�07��Ǯ�]����{�([��K�UG���c������׎3J���%��L\e5ݦ���iC���)�M?�A`��?���fu�ޓ>�x�T>F�D�u!G޶�e1�i�o�,���&Ŝ�X8��2�$�9 �W���$s�s���*��V�!1 ��h��pݎ���d�y���V6ب�Y��Ub�8�~�q�G��UM���u>�95���\/�^9�B�zU�2m�<�W�90[��_�SL������/���m�l�*���=�Y5C5�=�]O��n�iW�(,xFb��͆�������1!EsA�aW9=2�Wy�fl��%S��U�m�Z�����A�H�O���<�n����m!��_����=Z�G"��C�Sc���f�/H�y%Vפ�:��Q�ش�����k�v��v׭���A�}Ҭ� ���R�����S|7�{�r{�����?�ޝz����iyD����0�e���SB�j˞h�:JP)���l�����g�f�&����֖�e�_5��胂7*?���A�!��'�`V5�� ��{?|�2���{q D<�~�ŞB=q�A.Λ�.�##sSs�`/hLA9�p���M� qo�*����U@�:RB�*4!{A/޿|�gx�z� ��hG�Ch��-9��'.3,� zY��Ӫ:�U��ㄇ�0dh�[�w#�z��qYJ>l�@z'-��<������2b���
<K�p7��^�1y��~������3�R�J�C���A�i�U�o�^aˍ�~�5,Ii�-3@!=98�1uZ!1u.jg�����l�ru͆)�� �J���R3s�N��񱇯�R��ѫ�|����u^�Q�a`�P$~���ؙq���h�A336�SeXΛ�G��o�I���sSy2��GA��O�ߘ�4U'=�@%�oH��>���o��Z3$�IG���{���Y}&W�~�f��-P�hO��� t$k�6�1TQ�i�U���5۠���������V娿�h9����x�x�x� �ax�!KP�	k���@@B�U��s�*웺hΆ���_���yj�-iNSOFj�5�m�8���G�M���3V�m�|L>��*���#P�1��Y��8
JT�d>\W$O�����#e9$������ã*{�T��L���܃+��C�'\��R�ٽ�vˮY�$����9��r�BT0���.C�ѠN�-Oc�ga�̚��
k
���B2W	��c𩣜IYJ��<��&��m8��EVr5�ݺ۲Ww.��L��d(��ϗ�O�8 ����<�~[Ɗ5 �(�]�B��0�18�ߵ�-��'=\�E���׳�1ᢷA��~�(���~�4��,j~�\+e(9ND�$��2#�ewߍ�V���.�oG�~�6�,ζ7�����n�[h���u��f���f}h�BHW�8è�uX������#
 JzO	�ۺ��i�(h�m�5D�얣R�����D��m>�v������I�)��}�t��[��k�pHg���k�
@��Yj}�id�X0�U���P���D�FG����;��%�UMԌ� ���&i��֢f�Dj�n Jp�.1yL��+;p�+&G��J ��-�#*��:U>w˦g~;Ԝ��Ϟ�P2�u�؅*�D�4V��ڮ�9�a���� ! �0���v5�����z-��O��j`H`�SIR��{�KoT��cuL�Ö1vmŽ���Q/��bWu\5�e�������S��\�A,֤%�+���ž�Ҟ̮������/ $VD�A~d�'
Pԙ~�l��nwN�l�O���b�VrH��TT��A��S��9�ր�B�����}��V7����d ꡲVѸh��`+%����;a�U�?��ƨʦA
�
�`���rT��HX(]�Uqp:�"�ܜ
��SZ/_|�GV����pB�ԙ�����Y|s૓�F������@rӵYp�����Ӕ�~{ݬ�­��6�I C�vF��)Ͻm�e��#&��ʋ��Gw��A#%�pwkp�,��$���Omӿx�n�5�2H	.�o�z�l�oö��������9��Y)Jj$�9#+�N4��őQa�ˇ�Qæ!O���c�oL�I0g��h����f`��yn���b��D��:Xp(�x����l�"<���U"�;xIL[���OTv{h�;�)e�:����mө}]Bd �	�UD	�����+���~K,*�Z�D��8*0�?a�ٺe�	�7��{��RZ�K�8�G�� �#1w{�s��Y�"�#������<�����#R��P͢��1S    iH�\�NO��^]x޴�a* i-ߴ_�r�L���g��oH�!T�S��k]u��D��s?:�+ʹ8x�!���T^���v�ɜ���$�1grr�U�u�����u^.�oNT�1��m��C���*^7C.��pS
��O=HZ��?(���R�q��E������Ѱz�(�V��+��\��a9���"Ϥ2o0ۉk�4;'.�c�W<x�8��mw��0G�+2^�$��=i#���#GDc='��<�S5�L���iJx�EN�O�1�#��Ի\/��]�I���Y���7Mv����Tg�����"R�N(#8�,��,N�W�8��|-F@UJ��VJU�R�1-Q�O]S�*r%��f�����q��:,���U�v�f�_?>6�#)�6I���敱�M�ᝉ�3���(�S�i���9��]!�u���k唉�,|�M]']Æ�dU�$�Lm�(x��b~�����t���{����Hs��{���; �O�`7ا��F�n��������iE�6a���������2��M�b�I4��l�h]ʕ�Ԃ� @(;�%��߮7�)�(H~�D/Aey�0%(����r>�+�̀zr��P�"����H��$>��n3�=:$�]=s
N���r���T-�t؎��[A�^E�$)��b/��g�UshS�/�uXa�(��CLT���T?��<�}NƱK�nE�,FU5�O �T����a�A�Z@�����M)<m07�QR�7h5ܢ����=i9`�8sѮ�������Q���{4�ה�.@y��<|��P�k�8I��q���Ԙ������ ���O[0���o�5g��C� �ڧX��फ������9|oB��U���]NӘ���дeqJdW8s*؝ a)r�L��?�8��-�������/T`y��0�i��"�S�z�-�]�m�b�ϲA����<�A|�c�9��H<�=S��ˤ�f�:a��{��*	�)#u�������Buōi�*UTL�1 a`�&���/�d�ܷ��ծ�1��=�
Ԝ��(��-�1%������nu{���
����vu�7,�>����D��|4\�j?m� ����5�ai(�h;;��7�J{}[&�e�*�<�"��x?f~�䤁tsS~�U�����LRDg��F�������j���eC������F^�;��i�R��ܢ�Ѩ<�GP�yB�bR��m!3�ZcP�&��Sd�P�Ct5`cD��R3����f�#ɞ�s`��?���y����
�* %��;�rBL93�9|�R���K�ꑷK>U�� ���I���Me�'�ֵ~�al˘'��Y��(I�w2��=fƵw�9��1�/p>������0�����N��]�� �D�1��&j]M!r�QR�W뙼Qx�/r`��4���ܭ:�c�33�K{/�̄�2Hf[r�%��Y=�z���{� fW��!015������H!u�-��Z��J�\�"��*��Oɿ�O��B ��W�R#����Ů�}Se̳����Ρ�n�_��m�,��\�$�F�Ӱ��&vfv���=�m��I�;7���o?������j�����RY����{8,]T�Դ0��I�F��͑�&��+�t��r6���'Dk��:�h��/�׻f�ެ��G`����\�c�5�u��Ġ�������殽9��Yq�C�QmGJ�\����MH!�,�8��v��/
O�wta�iO��hjXL^H�6hJ����Ҍͦ������٤�-��
6�RhĆ���d�UGT��*����G��֑��ͺ�m֛�x+��,'3B��:�3��x F;Ԩ�Y���5�ịX��e96�O<���H��cn���AI+h���$b��-�`bݿ�b5� �`�Y?�X�)`�5E=4���/Ϋ9�Ǻ�r��:;��fu�>� ��JIa��/�z�h����
��O�g��$�����m�:���,keh�7 ��G�"��E�Eߪ˯l^r��ScHR#
ãJ<D�On��r �������H�$jv��h��c�0��}Β�����Go���w�K��!*��y�0bJ�2X(?�.��K�כ�Ѽ�co	E�	yp�.T|f������8�"�I���@��)�Q�1�_[�a��}s���L# �M	�!G���N��*��v]U�CNt�0}p0:�S�!��s��>6_��&�4�<�}z݂E=+��a\�X��f��7��7��y��D�|��hH>j쏋�=)���W�o�RS.�t���dm=�d8�^p��%pYm�+�QӖ��5q�YZ��* B"_���qD伩�\�g�����?�{0�g�}������AٴFB���K�[������ø�z�u�iO=��E��$U��ۯ�5P�2���f��ZQ{�����}D~Ɂ���۶eJ�b�?0qң�#���UA�� \tc�w��r��=�#��eT�`�������?���cW�L_23�'��H�! ?�L��
h�M3�$�zC6FG�d��C8EE$9���"�#�Z�l���؇�=��C%�Ɉ�(0i���5��a˓�2?��&nu�4��䀴p�^�80�H�l��*��&Ξ����)�}��v{(jc�7�sE��3������V˟>UNM"���R�Z3n0��<����a��!*�`!��u��Ɋ2��9K�ꌷps`M�s\�;*/���Z�f���;�o�4q�bO�����DD.����b�eM� +i�'^��_: �����,-��2����f"&-�.&�ͱ���TH�߆-��]�3q��x*��k.�
���<�XZ.�GsY��_���-+-�:�6�
��K\F������5���L�o��*�WA����LRjyUf�gG�����-Ha�b�	��l��RSc7��~�mƶ�O�U寰ي& ����;'�4�]�z�2ͪ� M�1l�@;�#�H�\����XLJ�T2�!b����1p�2S`v�䓟�NȬ^8#�	�nE5����-�j��ݴ�(ߥ93a�P��[����Dd��ǐ�����o�Yت�FV�V��[�����m:o���z7k}�if�
��$Ӈ�2JnbG��'��<���n�6<�q2��OR!���[R�:�[T_,:���'�	�r����4���"�V��I�Y�
L�*�&�@N��4��f��d��-�p����Bj�'\|�`M]�MJ��vuS�V���Á�@"z��l���ט���j�_xp�$��QU )�0��*�ה}Y�	�K���D�+�� �T̢���ssWS�jR��u�[�Wmg/ڲX�M=�J
Uz�)ױ��{��n�on�xv�����Gz�����ܦ����_�{|�F�R|�����T���£���%ɯ�f�]�Q�i�P�<އ�[.���i�M���0����֋cQd@�Ƚb���pdZ���2��Q���X�!��a:�[7��a��!�Z�ڸ:�S�Ѯ�&l�pם��d
Pz/��چ���Y�-Fk�ߴ�SB�I�7�����0�*wֵ˻nؖŊy�)������D��Y�O��B���Om�^�g�i���ش���Zlۆ-Z����H�7~N�^�bV3�)Kj���1P���QB
��W�v�֗ٲ?�k�$��`��HTH��qӰ=�\�uvmIig���qru��D�1����f[�0��$�I��`�Ԃ�NU��;���
^��P���І�e�-,J��h���+��r៓�z��U!�ԃ/�yg���pD�R�����y1_�G����1��8V�1��e�k�(�����k���h��q�
j
P&״�݁�)�|�,涜��K ��}���?m;��*�{:G�9�h���ޡ/HT��6�[T)�������'U��}��[�w�q���^�0�9p���,���N�}h�)���AB��*hT���Hji��n2�\�lb�T�e��7�=w��A����6��_�b1v��2(O�vO���ʾ`7����[�k6��+�-Q���ۢ�h!��R38�    �宾� ��
C=pVJ�K��ʾ|����Ş�٥8�ѕc�5 ˟����^�o�/.���Y#*������~n����1�Y�����
b�	,�/�ů�Lr�-{�Φ����au;C�>C�����805EFZ2W�����<��¾��5��*�v�F�!
̥� !���4���募��Yv�>�̯�N�(��(���7��O�s��-�I��ޠ,�TPtb%��B�<���o����;��j�<����c�テU��bzZi�(�:��lTP&m�Υt�Wh�����]F9�\/�	���[�����ԕE����7�G�{��=0\	�g�_��F��
�}���n�Κ��X�G�hDqXn��P��v�n�7�_����r�!��T��XTe��G�j�U���x4f��V>.ƪXi$�3_M�-�y���I�Zx\��oq�LFO�_�]����w��SSJ�.Q
�4�����~�Hش�̽V�H�Ɓwp"�;T�g1R3���zl�bK���������,�ZQ��P�RH�/|��u���Ӭ�F��?A_��ܠ|�:�+��a�u��Rr��q��>A�h�d�ew�N�)��Dـ�쩈��W�p�bD2�o
wj�^���m�����6�J��8�S�S�5�\��˪����;�4����@�HSD4��~(K(�f�.�F���ڗ79!8*�^Vm��u�(��u�2�-hn���] +۽D9UM2z�r&(BJ�]"Ph,�1dG,�}�+-�Fd+����9:�bC���m���v�nӏ��i�]$�{ȝ�F�ԨT�|�z:�+�T�m��LK�����n��QRo���0�x5Q�t\�T$(�!q�%f� ���+�'ݖ��5��+@�C*�$��= 
�&�H<�}��ݮxo<��I奠���+� f� 3�W��c,�,�>m��_ ��秚�JMwJ�Ȫ&�	&�&����b5FՑ0jl�m����RG�9��gN�v���kǃ�Ȉksӂ���>}���3t��cS���E��� �(t�~�֖��z�E����J+�|��GP�'u_�c@pH�k������rG`QC�=���i����D�pF�R�O��W"�*�uG�����+9+��Ĺ��2�|T���փǳyV��a�&T�H��T6���)��^��f���I9����O<3}�N�K�ٌƾ^t���s�%�HC�"���O�R��ތ���z$���fp����$NH�҅��&
{��=�>JU�M��BK�]rRp`�ț	��O��������g�[�)��:f`�=sڭ˹��ef�U��N/���By����o��a��+��8,�f	��k?,y���j6�'���v�Z@�KÓ���iMAib�6�צ|"m^f���p�T�Bp�����"<7hZw�C3�Yv[3��LU������G����X�l��̩�����U���³�/��o���z;
�}���&Rs�!��<1`hc��ً��o�E��tXoJ!��]@�q�9?�}�����7�x�*.��ջ�ϸyCr`f,~$c�Se�@�(AIl��-����J-:`���*X8�Y3���4%71�� �Զh\�.�]3��}�!���Ӊ&�Q4c��;n�\ib�h�J�T�a�$J��W,QAc�͗��k��!kV�ڿ4�*pCס��,&ߢ�I���_[^�qU������3xy�ĪɆ�\��\l���M�W�ݰ���a��i<��G��S?�EJ�����q�Z�����C�g�y�q;��[�����N�,�~j:d��pd�y�bQ]r�*��yCT� DN�|l�_˨L�<(����B� �s�����o6E��j��bE�K��E#��)��?�}�*T�LMT DQ������&�u�������ѹ�����3C��.PM��4�a�5�Y"��Fg> *����Q�z_n��{��3�]#@�N����<_�Ir�ŭ�����[�m��)�����dmi�TDEu9�_�n fV����e�f��c|'�V/R�Q�4����f~f��M���iG��8D�"�E��c;���-X&��9�ߍ)Vܲ�uwRQ��p� ?�	ײ�������J�@Y/ �@��S@�RN�uG6Ҵ����4�'�����Ҵ[�i~m��WYObxlVEe��ҟ��r���y�JZ����-͕�Z��^04��ݶ�j���ᅊ{�P��u���W\��*Jg����0��Wa]e�%���0(n'69v|J�3�
��#S(ng���'��^4�rV5pƭ��"A�z���7����SwS�,j���o�7/��Y~B�#����U�ڋV܃ϫ�N�"�����Hc��ѦKc��5�%1�J=���c*N�b��du��-N|������3<*��U2�xvQ�����뺻g�r*h�Z	�E'}2,	��Tq}�_����P� +��<dtܞ,�C�Q'}�*7�ٚ�`�RB$�����9$j��7́5�%U0O��pT���t�Gx�0���mi&Pp8fw38�)pL�(�|G���A�z��������sRxy'=���^&B�c]s�=l�R{\B�Er;��������������i���V1�4K��9&r�o���B(3Y45S������Q���ض�߆a�Y�YQ>��.S���w�2��.9}J�'�C��;�P[���
�<�0N�3T� �dpw��b�J�4B���eq���[s���+.� kJ�H|�����Y���Q�z�e�������i�W=��q��s���X��$jCa���K3�*'3l{��b`,u�m�M����N,/N�/�p�lF����^VLC�]���C%S�}X&��P���RXd�3|��7wۯez*3����W�T�7�
I	�˗�ȷ�������Jל˂O��P��8�UJ�@�^6��\U#��`�������֖#��b��l�f#�D8���B���|�k���r4��9�f)uX��������{���0<W�U&?���ƔO4�Y-U�JT��~�߷ݒ����͆���pF<(�@�er)sX���侁��Su6�3{X{^ۭp82f�HD�ኔF��=L����+	dP��6��t�I��\0e8����-���虋�Q�,'�ܴ\	K�V/��-���C�wE�	��_��vog4	� i}���i��O�l;�B�U5%1�A�N܌��!jb]�^�������L���ܐö4C�Ƃ�o�䰨V���w���xJB�8����#�K��$%S#����}��b;^Sv���!Q������׀��z��FmPLs��E[��iN#�����\�Z��ġv��˯�=�*9LZ�
���dO�Sp�HAA8ŵoI�爴 �~1��FF�X��黣�����%�D׷�o���0���UNB!��e���VCɉ�~B�wM�����|R*@�2�DD4��6@�'<�Z&Ȉ��6�ֳebL~7}��2���}��
���
#C���B4�]�߉M�lڇ�m��rQ�yC�h���R���T	���_c
4ӚH��5��A��*��f�/N����:'6�/Z�a��ٱ�߉倒v$N+�࡞9��T>-k�5��8"_"J$�k�޷����ן�ʹ-����&�����ﰔ�g�u�<�n�=��ec�TJp2�3�|s�4.�)2�����A�fA�ߩC�H�`�G��UQ�[��3�!~V��4�t��q$�����m���(X��Xzi���΍]y$���#�F=����[&$��X�b8sѮ�mY�ȇ�(���W�z�l�/�NC��#gA&oJd.M@_s
���yCf@h; v�.��8T)�4\��f�:8R_Wͅ�XQv=(���Wp��;.ݰ�G�o��_���J�F1����M�@Z��	"�Ǧ�UlC�̾<+�N'Qi���]��N�A��v��Yy���'T�N�zQFȰ9O�.rL��x2��5�n܅��B z�tz�� ͗d�[Xz�����2�����r��no< �  2�_a���I���Ky��<K%y�Ĭ�Xl����c�i�I�+Gd����2䫶��m����X�|��J/��]6G�v(�c��k�BE�Y�ĸ)�~�a#��u��{b>�Z^��G`��E���ĺ�+ty�\_��N
	ߜ�;M!8)�����]����m�v-Yc��)�cH�z�A`O��@E�V9�¿\t	���,��}ԧ�5���� -h�
��������������@� �i��Se�b[�������3�f	��
W�f��Iٔ��ն�1|�P�ʧ�[l��f�"�.�ԭ7l�n" ;��7M�2e0��ψ�&U�_�oy�k�\�7�����3�$y��Ap#�Vm������g��˰a/|�hf��� Z��
�ˊI�<H]�/�-z�_gd}"�
��
\���K��|uM��I�#b�-�F����3��G���=˲l��~��U��QyđJ�L)���0pԻxѭ�s�,W����<��,�, ,�q��>��i �u�nw����G�N��J��v|`��o���ziFJ���FIp���(���;#J�� ̉}�[*+���K�7&�w2�'�.bj��(�bR����)0D4�Esi�V8�|I��-���GR��*!�j���H��l�>t_K�/�P��s^^�4e�]��Ѧ�<����w�J��`b	U���n1��4���&�:6�X��[ɚJ���184�h��/pM�[
0#�:�+�nd�b:��伧��K�N��֬Q���b&n�ƺ��]^��-k����<n�	�� �J�<Dae���jشi@,I�z��!*u�u5��%͘w����ގ�r�g��$�>��pi�b�I\�����e���V#?���p	�cR7"�<�A����JK��kVޕ��`5:�Rݰ�-�e��noXqL$�Rs�Z�>e����
�)pL4�y�����ZJdHT"�Xn�L�""�ep���/M��2*yؠ^Pom��|�̈
����[�a
����ܶ��)�����s3�ŝ�zSj*�v]3ɬ��Q>- gz6#��K;5�ر�|(k���њ��p$�Iӌ���{B�A R���w!`���M�󂽮�7�}�${j��Q��M&�m5�n.+�I!�Ӈop��� @z&j?�6��r�D���P��Z��Qp\�?m�b�n@�Ն�|��'.��W@�X�)b���rh��ms_*��j%9��� �lp^���i���1���Uk�R��nHtH��G�"��䠨py��2��:����F$,jo�S*%1����]��W3��	7ÐJ�Q�����nǶL��<%�}�!���p[�0�¾�vӎoR��L+��{��V*�/Oq'�I=�|�/{+<���1@L�;�]��	��8":�ѩ�4J��*����w*`�b��k������b*p��dˡD�1ϛD�R2L�L�w��f�աtE��IK���*���F�on�jU��!���vD�-9u�TUI��X9Q3B�U"7�g���y�������x������j�lS����4�P��#���n��~1�9�:��%�}��=�ۇsDA`�p'�΂Sq�d�Q�]�"D�]�9,o����?׈�(�N��,�ճm�@!g�����H瀒bV�̫:;i�j�A��{'�*�����$�16E����ܙhp	.MJ��Ia��%�ۊ9j��_^���C�CH�xY&o:C@2d�����v�Y��0��v��
J$iM�����9eesH�	~>�ú�ny��9����0`�1/Ub�M�ȧ��cIw�,���D@~Ȼ�9"j0��D�n�]�W��Ɏ ��r<D�_����3n�!�j���n�hdT�����w���H-�WC��W*�	�hb_ ;����D�����$��z�Qt�S#p[UX���~�v��m*�W���]OuP�0ǘ�s$7���m_F�����Ll8�c��d�tD�=��{�!:d�f/�_�m�a8�>&�B��ﻬ�pO�u.qg�l�-�7��_���-��z�(�"mڴ�2���0<�?�6��dD^p����vT[�3���3r��ư��kUjr{產�!�5Ѡ����{�xF�P^�ks��<
�����D��v�/}F�� ����n2i��o����|?���35H&CR�a����Uw��3��֚�#�|ڈc�eL���:sL
ӵ�-��wGȚ��b��c�M"�}�C}�������� ;      !      x������ � �            x������ � �         �   x�-�=n�0Fg�:A��Ң��f�BH*�� ��ަc���+mw{����C����2��y��c���({�����Y��7�*�R�|�`-���z
���x��)�ȁ��ķ(2I��#�<v\��B���@SZ���<Q1�$W*hW��W2gaO]B�����Hʞ�n��.<�oA���8�v���+��W���3��Wރ~B�{�TB��^��� ��Wc      %      x������ � �      #      x������ � �      '      x������ � �     